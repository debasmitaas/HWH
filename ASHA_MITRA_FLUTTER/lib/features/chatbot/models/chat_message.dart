enum MessageType {
  user,
  bot,
  image,
  loading,
  error,
}

class ChatMessage {
  final String id;
  final String text;
  final String? imageUrl;
  final MessageType type;
  final DateTime timestamp;

  ChatMessage({
    required this.id,
    required this.text,
    this.imageUrl,
    required this.type,
    required this.timestamp,
  });

  bool get isUser => type == MessageType.user;
  bool get isBot => type == MessageType.bot;
  bool get isImage => type == MessageType.image;
  bool get isLoading => type == MessageType.loading;
  bool get isError => type == MessageType.error;

  factory ChatMessage.user({
    required String text,
  }) {
    return ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text,
      type: MessageType.user,
      timestamp: DateTime.now(),
    );
  }

  factory ChatMessage.bot({
    required String text,
  }) {
    return ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text,
      type: MessageType.bot,
      timestamp: DateTime.now(),
    );
  }

  factory ChatMessage.image({
    required String imageUrl,
    String text = 'Image',
  }) {
    return ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text,
      imageUrl: imageUrl,
      type: MessageType.image,
      timestamp: DateTime.now(),
    );
  }

  factory ChatMessage.loading() {
    return ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: 'Loading...',
      type: MessageType.loading,
      timestamp: DateTime.now(),
    );
  }

  factory ChatMessage.error({
    required String text,
  }) {
    return ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text,
      type: MessageType.error,
      timestamp: DateTime.now(),
    );
  }
}
