import 'package:flutter_test/flutter_test.dart';

import '../lib/features/chatbot/models/chat_message.dart';

void main() {
  group('ChatMessage', () {
    test('should create a user message correctly', () {
      final message = ChatMessage.user(text: 'Hello');
      
      expect(message.text, 'Hello');
      expect(message.type, MessageType.user);
      expect(message.isUser, true);
      expect(message.isBot, false);
    });
    
    test('should create a bot message correctly', () {
      final message = ChatMessage.bot(text: 'How can I help you?');
      
      expect(message.text, 'How can I help you?');
      expect(message.type, MessageType.bot);
      expect(message.isUser, false);
      expect(message.isBot, true);
    });
    
    test('should create an image message correctly', () {
      final message = ChatMessage.image(imageUrl: 'path/to/image.jpg');
      
      expect(message.text, 'Image');
      expect(message.imageUrl, 'path/to/image.jpg');
      expect(message.type, MessageType.image);
      expect(message.isImage, true);
    });
    
    test('should create a loading message correctly', () {
      final message = ChatMessage.loading();
      
      expect(message.text, 'Loading...');
      expect(message.type, MessageType.loading);
      expect(message.isLoading, true);
    });
    
    test('should create an error message correctly', () {
      final message = ChatMessage.error(text: 'An error occurred');
      
      expect(message.text, 'An error occurred');
      expect(message.type, MessageType.error);
      expect(message.isError, true);
    });
  });
}
