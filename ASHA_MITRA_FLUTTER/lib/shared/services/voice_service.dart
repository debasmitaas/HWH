import 'dart:async';
import 'package:flutter/foundation.dart' show debugPrint;
import 'package:speech_to_text/speech_to_text.dart';

class VoiceService {
  // Set this to true to use mock voice recognition for testing
  // When true, it will always return "Test Voice Input" after a delay
  static const bool _useMockVoiceRecognition = false;
  
  final SpeechToText _speechToText = SpeechToText();
  bool _isInitialized = false;
  bool _isListening = false;
  String _lastRecognizedText = '';
  String _finalRecognizedText = '';
  Completer<String>? _recognitionCompleter;

  Future<bool> initialize() async {
    try {
      // Check if already initialized
      if (_isInitialized) {
        debugPrint('🎤 Voice service already initialized, skipping initialization');
        return true;
      }
      
      debugPrint('🎤 Initializing speech_to_text plugin...');
      _isInitialized = await _speechToText.initialize(
        onError: (error) {
          debugPrint('🎤 Speech recognition ERROR: ${error.errorMsg} (perm: ${error.permanent})');
          if (_recognitionCompleter != null && !_recognitionCompleter!.isCompleted) {
            debugPrint('🎤 Completing recognition with error due to: ${error.errorMsg}');
            _recognitionCompleter!.completeError('Speech recognition error: ${error.errorMsg}');
          }
        },
        onStatus: (status) {
          debugPrint('🎤 Speech recognition status change: "$status"');
          if (status == 'done' || status == 'notListening') {
            _isListening = false;
            if (_recognitionCompleter != null && !_recognitionCompleter!.isCompleted) {
              // Choose the best text to return - prioritize final text
              String bestText = _finalRecognizedText.isNotEmpty ? 
                  _finalRecognizedText : _lastRecognizedText;
              debugPrint('🎤 Completing recognition on status "$status" with text: "$bestText"');
              _recognitionCompleter!.complete(bestText);
            }
          }
        },
        debugLogging: true,
      );
      
      if (_isInitialized) {
        debugPrint('🎤 Voice service initialized successfully');
        
        // Check permissions
        final hasPermission = await _speechToText.hasPermission;
        if (!hasPermission) {
          debugPrint('🎤 Microphone permission not granted');
          return false;
        }
        
        return true;
      } else {
        debugPrint('🎤 Voice service failed to initialize - speech recognition not available');
        return false;
      }
      
    } catch (e) {
      debugPrint('🎤 Voice service initialization error: $e');
      _isInitialized = false;
      return false;
    }
  }

  Future<String> startListening({String language = 'en-US'}) async {
    if (!_isInitialized && !_useMockVoiceRecognition) {
      throw Exception('Voice service not initialized');
    }

    if (_isListening) {
      await stopListening();
    }

    // Reset all tracking variables
    _lastRecognizedText = '';
    _finalRecognizedText = '';
    _recognitionCompleter = Completer<String>();
    
    // Special case for testing/debugging - use mock voice recognition
    if (_useMockVoiceRecognition) {
      debugPrint('🎤 Using MOCK voice recognition for testing');
      _isListening = true;
      
      // Simulate a delay
      await Future.delayed(const Duration(seconds: 2));
      
      // Return a test string
      const mockResult = "Test Voice Input";
      _lastRecognizedText = mockResult;
      _finalRecognizedText = mockResult;
      
      debugPrint('🎤 MOCK voice recognition returning: "$mockResult"');
      return mockResult;
    }
    
    try {
      debugPrint('🎤 Starting voice listening for language: $language');
      _isListening = true;
      
      // Track best recognized text
      String bestRecognizedText = '';
      
      await _speechToText.listen(
        onResult: (result) {
          debugPrint('🎤 Voice recognition result: "${result.recognizedWords}" (final: ${result.finalResult})');
          
          if (result.recognizedWords.isNotEmpty) {
            _lastRecognizedText = result.recognizedWords;
            
            // Always save the latest result, especially if it's final
            if (result.finalResult) {
              _finalRecognizedText = result.recognizedWords;
              bestRecognizedText = result.recognizedWords;
              
              debugPrint('🎤 FINAL RESULT RECEIVED: "${result.recognizedWords}"');
              
              // Complete the completer with the final result
              if (_recognitionCompleter != null && !_recognitionCompleter!.isCompleted) {
                debugPrint('🎤 COMPLETING COMPLETER with final result: "${result.recognizedWords}"');
                _recognitionCompleter!.complete(result.recognizedWords);
              }
            } else if (bestRecognizedText.isEmpty) {
              // If we don't have a final result yet, keep the best interim result
              bestRecognizedText = result.recognizedWords;
            }
          }
        },
        listenFor: const Duration(seconds: 30),  // Increased to 30 seconds
        pauseFor: const Duration(seconds: 5),  // Increased pause to 5 seconds
        partialResults: true,
        localeId: language,
        listenMode: ListenMode.confirmation,
        cancelOnError: false
      );

      // Wait for recognition to complete
      String finalResult;
      try {
        // Wait up to 35 seconds for recognition to complete
        finalResult = await _recognitionCompleter!.future.timeout(
          const Duration(seconds: 35),
          onTimeout: () {
            debugPrint('🎤 Recognition completer timed out!');
            
            // First choice: use the final result if available
            if (_finalRecognizedText.isNotEmpty) {
              debugPrint('🎤 Using final recognized text: "$_finalRecognizedText"');
              return _finalRecognizedText;
            }
            
            // Second choice: use the last non-empty result
            if (_lastRecognizedText.isNotEmpty) {
              debugPrint('🎤 Using last recognized text: "$_lastRecognizedText"');
              return _lastRecognizedText;
            }
            
            // Third choice: use the best result we stored
            if (bestRecognizedText.isNotEmpty) {
              debugPrint('🎤 Using best recognized text: "$bestRecognizedText"');
              return bestRecognizedText;
            }
            
            // Fallback: nothing recognized
            debugPrint('🎤 No speech detected at all');
            return '';
          },
        );
      } catch (e) {
        debugPrint('🎤 Error while waiting for recognition result: $e');
        
        // Use best available text if completer failed
        if (_finalRecognizedText.isNotEmpty) {
          finalResult = _finalRecognizedText;
        } else if (_lastRecognizedText.isNotEmpty) {
          finalResult = _lastRecognizedText;
        } else {
          finalResult = bestRecognizedText;
        }
      }
      
      debugPrint('🎤 🔴 Voice service returning FINAL result: "$finalResult"');
      return finalResult;
    } catch (e) {
      _isListening = false;
      debugPrint('🎤 Error during voice recognition: $e');
      
      // Return best available text even if there was an error
      String result = '';
      
      if (_finalRecognizedText.isNotEmpty) {
        result = _finalRecognizedText;
        debugPrint('🎤 Returning final text after error: "$result"');
      } else if (_lastRecognizedText.isNotEmpty) {
        result = _lastRecognizedText;
        debugPrint('🎤 Returning last recognized text after error: "$result"');
      }
      
      return result;
    }
  }

  Future<void> stopListening() async {
    try {
      if (_isListening) {
        debugPrint('🎤 Stopping voice recognition manually');
        await _speechToText.stop();
        _isListening = false;
        debugPrint('🎤 Voice listening stopped manually');
      }
      
      if (_recognitionCompleter != null && !_recognitionCompleter!.isCompleted) {
        // Prioritize final text first if available
        if (_finalRecognizedText.isNotEmpty) {
          debugPrint('🎤 Completing with final recognized text: "$_finalRecognizedText"');
          _recognitionCompleter!.complete(_finalRecognizedText);
        }
        // Otherwise use last recognized text if available
        else if (_lastRecognizedText.isNotEmpty) {
          debugPrint('🎤 Completing with last recognized text: "$_lastRecognizedText"');
          _recognitionCompleter!.complete(_lastRecognizedText);
        }
        // If no text was recognized at all
        else {
          debugPrint('🎤 No recognized text available, completing with empty string');
          _recognitionCompleter!.complete('');
        }
      }
    } catch (e) {
      debugPrint('🎤 Error stopping voice recognition: $e');
    }
  }

  bool get isListening => _isListening;
  bool get isInitialized => _isInitialized;
  String get lastRecognizedText => _lastRecognizedText;
  
  Future<List<LocaleName>> getAvailableLocales() async => await _speechToText.locales();
  Future<bool> checkPermission() async => await _speechToText.hasPermission;

  void dispose() {
    if (_isListening) {
      _speechToText.stop();
    }
    _isListening = false;
    _isInitialized = false;
    _lastRecognizedText = '';
    _finalRecognizedText = '';
    debugPrint('🎤 Voice service disposed');
  }
}
