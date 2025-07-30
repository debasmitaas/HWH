import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:permission_handler/permission_handler.dart';

import '../../../shared/providers/language_provider.dart';
import '../../../shared/providers/chatbot_provider.dart';
import '../../../shared/widgets/language_toggle.dart';
import '../widgets/chat_bubble.dart';

class ChatbotScreen extends ConsumerStatefulWidget {
  const ChatbotScreen({super.key});

  @override
  ConsumerState<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends ConsumerState<ChatbotScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final ImagePicker _imagePicker = ImagePicker();
  final stt.SpeechToText _speechToText = stt.SpeechToText();
  bool _isListening = false;
  bool _isRecognizerInitialized = false;

  @override
  void initState() {
    super.initState();
    _initSpeechRecognizer();
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _initSpeechRecognizer() async {
    try {
      final micPermissionStatus = await Permission.microphone.status;
      if (!micPermissionStatus.isGranted) {
        final status = await Permission.microphone.request();
        if (!status.isGranted) return;
      }

      final available = await _speechToText.initialize(
        onStatus: (status) => debugPrint('Speech recognition status: $status'),
        onError: (errorNotification) => debugPrint('Speech recognition error: $errorNotification'),
      );
      
      if (mounted) {
        setState(() {
          _isRecognizerInitialized = available;
        });
      }
    } catch (e) {
      debugPrint('Failed to initialize speech recognizer: $e');
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _handleSend() {
    final message = _messageController.text.trim();
    if (message.isEmpty) return;

    ref.read(chatbotProvider.notifier).sendMessage(message);
    _messageController.clear();
    _scrollToBottom();
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedImage = await _imagePicker.pickImage(source: source);
      if (pickedImage == null) return;

      ref.read(chatbotProvider.notifier).sendImageForAnalysis(File(pickedImage.path));
      _scrollToBottom();
    } catch (e) {
      debugPrint('Error picking image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error picking image: $e')),
      );
    }
  }

  void _toggleListening() async {
    if (!_isRecognizerInitialized) {
      await _initSpeechRecognizer();
      if (!_isRecognizerInitialized) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(ref.read(textsProvider).speechRecognitionNotAvailable)),
        );
        return;
      }
    }

    if (!_isListening) {
      setState(() => _isListening = true);
      
      // Use the appropriate language based on the selected language
      final currentLanguage = ref.read(languageProvider);
      final localeId = currentLanguage == Language.bengali ? 'bn_IN' : 'en_US';
      
      await _speechToText.listen(
        onResult: (result) {
          setState(() {
            _messageController.text = result.recognizedWords;
          });
        },
        localeId: localeId,
      );
    } else {
      setState(() => _isListening = false);
      await _speechToText.stop();
      
      // If we have some text, send it
      if (_messageController.text.isNotEmpty) {
        _handleSend();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final texts = ref.watch(textsProvider);
    final messages = ref.watch(chatbotProvider);
    
    // Scroll to bottom when new messages are added
    if (messages.isNotEmpty) {
      _scrollToBottom();
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text(texts.chatWithAssistant),
        elevation: 2,
        actions: [
          const LanguageToggle(),
          const SizedBox(width: 12),
        ],
      ),
      body: Column(
        children: [
          // Chat messages
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              itemCount: messages.length,
              itemBuilder: (context, index) => ChatBubble(message: messages[index]),
            ),
          ),
          
          // Input area
          Container(
            padding: const EdgeInsets.all(12.0),
            margin: const EdgeInsets.only(bottom: 24.0), // Add margin to move it higher
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 3,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      // Upload button
                      IconButton(
                        icon: const Icon(Icons.add_photo_alternate),
                        tooltip: texts.uploadPrescription,
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true, // Allow more control over height
                            constraints: BoxConstraints(
                              maxHeight: MediaQuery.of(context).size.height * 0.4, // Set to 40% of screen height
                            ),
                            builder: (context) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(height: 10),
                                  ListTile(
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                                    leading: const Icon(Icons.camera_alt, size: 28),
                                    title: Text(texts.takePicture, style: const TextStyle(fontSize: 16)),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      _pickImage(ImageSource.camera);
                                    },
                                  ),
                                  const SizedBox(height: 10),
                                  ListTile(
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                                    leading: const Icon(Icons.photo_library, size: 28),
                                    title: Text(texts.selectFromGallery, style: const TextStyle(fontSize: 16)),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      _pickImage(ImageSource.gallery);
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      
                      // Text input
                      Expanded(
                        child: TextField(
                          controller: _messageController,
                          decoration: InputDecoration(
                            hintText: texts.askMeAnything,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 12.0,
                            ),
                          ),
                          textInputAction: TextInputAction.send,
                          onSubmitted: (_) => _handleSend(),
                        ),
                      ),
                      
                      const SizedBox(width: 8.0),
                      
                      // Voice input button
                      IconButton(
                        icon: Icon(
                          _isListening ? Icons.mic : Icons.mic_none,
                          color: _isListening 
                              ? Theme.of(context).colorScheme.primary
                              : null,
                        ),
                        tooltip: _isListening ? texts.listening : texts.tapToSpeak,
                        onPressed: _toggleListening,
                      ),
                      
                      // Send button
                      IconButton(
                        icon: const Icon(Icons.send),
                        tooltip: texts.sendMessage,
                        onPressed: _handleSend,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
