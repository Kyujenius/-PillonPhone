
class ChatListItemModel {
  final String pharmacyName;
  final String? pharmacyImage;
  final String lastMessage;
  final int messageCount;
  final String lastMessageTime;

  ChatListItemModel({
    required this.pharmacyName,
    this.pharmacyImage,
    required this.lastMessage,
    required this.messageCount,
    required this.lastMessageTime,
  });
}