import 'package:flutter/material.dart';
import 'dart:io';

import '../models/chat_message.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessage message;
  
  const ChatBubble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final isUserMessage = message.isUser;
    final themeData = Theme.of(context);
    
    return Align(
      alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: _getBubbleColor(themeData),
          borderRadius: _getBorderRadius(isUserMessage),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (message.isLoading) {
      return const SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    }
    
    // Check if the message has an image URL (regardless of message type)
    if (message.imageUrl != null) {
      return Column(
        crossAxisAlignment: message.isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.file(
              File(message.imageUrl!),
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          if (message.text.isNotEmpty && message.text != 'Image')
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                message.text,
                style: _getTextStyle(context),
              ),
            ),
        ],
      );
    }

    return Text(
      message.text,
      style: _getTextStyle(context),
    );
  }

  BorderRadius _getBorderRadius(bool isUserMessage) {
    const double radius = 16.0;
    return BorderRadius.only(
      topLeft: const Radius.circular(radius),
      topRight: const Radius.circular(radius),
      bottomLeft: isUserMessage 
          ? const Radius.circular(radius) 
          : const Radius.circular(5.0),
      bottomRight: !isUserMessage 
          ? const Radius.circular(radius) 
          : const Radius.circular(5.0),
    );
  }

  Color _getBubbleColor(ThemeData themeData) {
    if (message.isLoading) {
      return themeData.colorScheme.primary.withOpacity(0.7);
    }
    
    if (message.isError) {
      return Colors.red.shade100;
    }
    
    if (message.isUser) {
      return themeData.colorScheme.primary;
    }
    
    return themeData.colorScheme.surfaceVariant;
  }

  TextStyle _getTextStyle(BuildContext context) {
    final themeData = Theme.of(context);
    
    if (message.isError) {
      return TextStyle(
        color: Colors.red.shade900,
      );
    }
    
    if (message.isUser) {
      return const TextStyle(
        color: Colors.white,
      );
    }
    
    return TextStyle(
      color: themeData.colorScheme.onSurfaceVariant,
    );
  }
}
