import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/language_provider.dart';
import '../providers/voice_service_provider.dart';

class VoiceInputButton extends ConsumerStatefulWidget {
  final Function(String)? onVoiceInput;
  final String? hint;
  final String? heroTag;
  
  const VoiceInputButton({
    super.key,
    this.onVoiceInput,
    this.hint,
    this.heroTag,
  });

  @override
  ConsumerState<VoiceInputButton> createState() => _VoiceInputButtonState();
}

class _VoiceInputButtonState extends ConsumerState<VoiceInputButton>
    with SingleTickerProviderStateMixin {
  bool _isListening = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: FloatingActionButton(
            heroTag: widget.heroTag ?? UniqueKey().toString(),
            onPressed: _isListening ? _stopListening : _startListening,
            backgroundColor: _isListening 
                ? Colors.red 
                : Theme.of(context).colorScheme.primary,
            child: Icon(
              _isListening ? Icons.mic : Icons.mic_none,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }

  Future<void> _startListening() async {
    try {
      setState(() => _isListening = true);
      _animationController.repeat(reverse: true);
      
      final voiceService = ref.read(voiceServiceProvider.notifier);
      final currentLanguage = ref.read(languageProvider);
      
      // Initialize voice service if not already done
      if (!voiceService.isInitialized) {
        // Show initialization feedback
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Initializing voice recognition...'),
              backgroundColor: Colors.blue,
              duration: Duration(seconds: 2),
            ),
          );
        }
        
        final initialized = await voiceService.initialize();
        if (!initialized) {
          throw Exception('Speech recognition not available on this device');
        }
      }
      
      // Show listening feedback
      if (mounted) {
        final listeningMessage = widget.hint != null 
            ? 'Listening... Speak ${widget.hint!.toLowerCase()} clearly'
            : 'Listening... Speak clearly';
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.mic, color: Colors.white),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(listeningMessage),
                      const Text('Wait up to 30 seconds, tap mic icon to stop', 
                        style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
      
      String result;
      try {
        debugPrint('🎤 VoiceInputButton: Calling startListening...');
        result = await voiceService.startListening(
          language: currentLanguage == Language.bengali ? 'bn-BD' : 'en-US',
        );
        
        debugPrint('🎤 VoiceInputButton: Raw result received: "$result"');
        debugPrint('🎤 VoiceInputButton: Result length: ${result.length}');
        debugPrint('🎤 VoiceInputButton: Result non-empty: ${result.isNotEmpty}');
      } catch (e) {
        debugPrint('🎤 VoiceInputButton: Error during listening: $e');
        result = '';
      }
      
      // Process the result
      if (mounted) {
        debugPrint('🎤 VoiceInputButton: Widget is mounted, processing result');
        debugPrint('🎤 VoiceInputButton: onVoiceInput callback exists: ${widget.onVoiceInput != null}');
        
        // ALWAYS call the callback if it exists - even if result is empty now
        // The real result might come in later via status updates
        if (widget.onVoiceInput != null) {
          // First immediate call - might be empty at this point
          if (result.isNotEmpty) {
            debugPrint('🎤 VoiceInputButton: Immediately calling callback with: "$result"');
            widget.onVoiceInput!(result);
          } else {
            debugPrint('🎤 VoiceInputButton: Initial result is empty, waiting for final result');
          }
          
          // Schedule multiple attempts to call the callback with any result that might come in
          // This ensures we catch any delayed recognition results
          for (var delay in [100, 300, 500, 1000]) {
            Future.delayed(Duration(milliseconds: delay), () {
              if (!mounted) return;
              
              // Check if we have a result now
              final voiceService = ref.read(voiceServiceProvider.notifier);
              final latestResult = voiceService.lastRecognizedText;
              
              debugPrint('🎤 VoiceInputButton: Delayed check ($delay ms), latest result: "$latestResult"');
              
              if (latestResult.isNotEmpty) {
                debugPrint('🎤 VoiceInputButton: Calling callback with latest result: "$latestResult"');
                widget.onVoiceInput!(latestResult);
              }
            });
          }
        } else {
          debugPrint('🎤 VoiceInputButton: No callback provided');
        }
        
        // Show voice input result with attention-grabbing animation
        if (result.isNotEmpty) {
          // Success case - show green snackbar with the recognized text
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.check_circle, color: Colors.white),
                  const SizedBox(height: 4),
                  Text('Voice input recognized: "$result"', 
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Text('Text will be set in the field')
                ],
              ),
              backgroundColor: Colors.green.shade700,
              duration: const Duration(seconds: 3),
              behavior: SnackBarBehavior.floating,
              margin: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
          
          // Also show a visual flash animation on success
          if (mounted) {
            // Flash animation effect
            Future.delayed(const Duration(milliseconds: 50), () {
              if (mounted) {
                setState(() {}); // Force rebuild for visual feedback
              }
            });
          }
        } else {
          // No speech detected case
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('No speech detected. Please try again.'),
              backgroundColor: Colors.orange,
              duration: const Duration(seconds: 2),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('🎤 Voice input error: $e');
      String errorMessage = 'Voice input error';
      
      if (e.toString().contains('permission')) {
        errorMessage = 'Microphone permission required. Please enable in device settings.';
      } else if (e.toString().contains('timeout')) {
        errorMessage = 'Voice input timeout. Please try speaking again.';
      } else if (e.toString().contains('not available')) {
        errorMessage = 'Speech recognition not available on this device.';
      } else if (e.toString().contains('multipleRequests')) {
        errorMessage = 'Voice recognition is busy. Please wait and try again.';
      } else {
        errorMessage = 'Voice input failed. Please try again or type manually.';
      }
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 4),
          ),
        );
      }
    } finally {
      await _stopListening();
    }
  }

  Future<void> _stopListening() async {
    if (!_isListening) return;
    
    try {
      final voiceService = ref.read(voiceServiceProvider.notifier);
      await voiceService.stopListening();
    } finally {
      setState(() => _isListening = false);
      _animationController.stop();
      _animationController.reset();
    }
  }
}
