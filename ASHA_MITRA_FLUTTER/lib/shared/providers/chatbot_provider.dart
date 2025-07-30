import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/chatbot/models/chat_message.dart';
import '../../features/chatbot/services/chatbot_service.dart';
import 'language_provider.dart';

class ChatbotNotifier extends StateNotifier<List<ChatMessage>> {
  final ChatbotService _chatbotService;
  final Ref _ref;
  
  ChatbotNotifier(this._chatbotService, this._ref) : super([]) {
    _initializeWelcomeMessage();
  }
  
  void _initializeWelcomeMessage() {
    final texts = _ref.read(textsProvider);
    state = [
      ChatMessage.bot(
        text: texts.chatbotWelcomeMessage,
      ),
    ];
  }

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    // Add user message
    final userMessage = ChatMessage.user(text: text);
    state = [...state, userMessage];
    
    // Add loading message
    final loadingMessage = ChatMessage.loading();
    state = [...state, loadingMessage];

    try {
      // Get response from AI
      final response = await _chatbotService.sendMessage(text);
      
      // Remove loading message and add bot response
      state = [
        ...state.where((message) => message.id != loadingMessage.id),
        ChatMessage.bot(text: response),
      ];
    } catch (e) {
      // Remove loading message and add error message
      final currentLanguage = _ref.read(languageProvider);
      final errorMessage = currentLanguage == Language.bengali
          ? 'উত্তর পেতে ব্যর্থ হয়েছি। অনুগ্রহ করে আবার চেষ্টা করুন।'
          : 'Failed to get response. Please try again.';
          
      state = [
        ...state.where((message) => message.id != loadingMessage.id),
        ChatMessage.error(text: errorMessage),
      ];
    }
  }

  Future<void> sendImageForAnalysis(File image, [String message = 'Prescription Image']) async {
    // Add image message as a user message
    final imageUrl = image.path;
    // Create a custom user message with image
    final imageMessage = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: message, // Use the provided message or default
      imageUrl: imageUrl,
      type: MessageType.user, // Set as user type to keep it on the right side
      timestamp: DateTime.now(),
    );
    state = [...state, imageMessage];

    // Add loading message
    final loadingMessage = ChatMessage.loading();
    state = [...state, loadingMessage];

    try {
      // Get analysis from service
      final analysis = await _chatbotService.analyzePrescription(image);
      
      // Remove loading message and add bot response
      state = [
        ...state.where((message) => message.id != loadingMessage.id),
        ChatMessage.bot(text: analysis),
      ];
    } catch (e) {
      // Remove loading message and add error message
      final currentLanguage = _ref.read(languageProvider);
      final errorMessage = currentLanguage == Language.bengali
          ? 'ছবি বিশ্লেষণ করতে ব্যর্থ হয়েছি। অনুগ্রহ করে আবার চেষ্টা করুন বা আরও পরিষ্কার ছবি তুলুন।'
          : 'Failed to analyze image. Please try again or take a clearer photo.';
          
      state = [
        ...state.where((message) => message.id != loadingMessage.id),
        ChatMessage.error(text: errorMessage),
      ];
    }
  }
}

final chatbotServiceProvider = Provider<ChatbotService>((ref) {
  final language = ref.watch(languageProvider);
  return ChatbotService(language: language);
});

final chatbotProvider = StateNotifierProvider<ChatbotNotifier, List<ChatMessage>>((ref) {
  final chatbotService = ref.watch(chatbotServiceProvider);
  return ChatbotNotifier(chatbotService, ref);
});
