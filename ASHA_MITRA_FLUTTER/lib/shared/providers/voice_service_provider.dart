import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/voice_service.dart';

class VoiceServiceNotifier extends StateNotifier<VoiceServiceState> {
  final VoiceService _voiceService = VoiceService();
  bool _isInitializing = false;

  VoiceServiceNotifier() : super(VoiceServiceState.idle);

  Future<String> startListening({String language = 'en-US'}) async {
    try {
      // Ensure initialization
      if (!_voiceService.isInitialized && !_isInitializing) {
        print('🎤 VoiceServiceNotifier: Voice service not initialized, initializing now');
        await initialize();
      }
      
      // Wait for any ongoing initialization
      while (_isInitializing) {
        print('🎤 VoiceServiceNotifier: Waiting for ongoing initialization...');
        await Future.delayed(const Duration(milliseconds: 100));
      }
      
      if (!_voiceService.isInitialized) {
        print('🎤 VoiceServiceNotifier: Initialization failed, cannot start listening');
        throw Exception('Voice service failed to initialize');
      }
      
      print('🎤 VoiceServiceNotifier: Setting state to listening');
      state = VoiceServiceState.listening;
      
      print('🎤 VoiceServiceNotifier: Starting listening for language: $language');
      final result = await _voiceService.startListening(language: language);
      
      print('🎤 VoiceServiceNotifier: Voice recognition completed with result: "$result"');
      state = VoiceServiceState.idle;
      return result;
    } catch (e) {
      print('🎤 VoiceServiceNotifier: Error during listening: $e');
      state = VoiceServiceState.error;
      rethrow;
    }
  }

  Future<void> stopListening() async {
    try {
      print('🎤 VoiceServiceNotifier: Stopping listening');
      await _voiceService.stopListening();
      print('🎤 VoiceServiceNotifier: Listening stopped, setting state to idle');
      state = VoiceServiceState.idle;
    } catch (e) {
      print('🎤 VoiceServiceNotifier: Error stopping listening: $e');
      state = VoiceServiceState.error;
      rethrow;
    }
  }

  Future<bool> initialize() async {
    if (_isInitializing) {
      print('🎤 VoiceServiceNotifier: Initialization already in progress');
      return _voiceService.isInitialized;
    }
    
    if (_voiceService.isInitialized) {
      print('🎤 VoiceServiceNotifier: Already initialized');
      return true;
    }
    
    try {
      print('🎤 VoiceServiceNotifier: Starting initialization');
      _isInitializing = true;
      state = VoiceServiceState.initializing;
      
      final result = await _voiceService.initialize();
      
      print('🎤 VoiceServiceNotifier: Initialization result: $result');
      state = result ? VoiceServiceState.idle : VoiceServiceState.error;
      return result;
    } catch (e) {
      print('🎤 VoiceServiceNotifier: Initialization failed: $e');
      state = VoiceServiceState.error;
      return false;
    } finally {
      _isInitializing = false;
      print('🎤 VoiceServiceNotifier: Initialization completed, isInitialized=${_voiceService.isInitialized}');
    }
  }

  bool get isListening => _voiceService.isListening;
  bool get isInitialized => _voiceService.isInitialized;
  String get lastRecognizedText => _voiceService.lastRecognizedText;

  @override
  void dispose() {
    _voiceService.dispose();
    super.dispose();
  }
}

enum VoiceServiceState {
  idle,
  initializing,
  listening,
  error,
}

final voiceServiceProvider = StateNotifierProvider<VoiceServiceNotifier, VoiceServiceState>((ref) {
  return VoiceServiceNotifier();
});
