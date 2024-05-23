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

  ChatListItemModel copyWith({
    String? pharmacyName,
    String? pharmacyImage,
    String? lastMessage,
    int? messageCount,
    String? lastMessageTime,
  }) {
    return ChatListItemModel(
      pharmacyName: pharmacyName ?? this.pharmacyName,
      pharmacyImage: pharmacyImage ?? this.pharmacyImage,
      lastMessage: lastMessage ?? this.lastMessage,
      messageCount: messageCount ?? this.messageCount,
      lastMessageTime: lastMessageTime ?? this.lastMessageTime,
    );
  }

  factory ChatListItemModel.fromJson(Map<String, dynamic> json) {
    return ChatListItemModel(
      pharmacyName: json['pharmacyName'],
      pharmacyImage: json['pharmacyImage'],
      lastMessage: json['lastMessage'],
      messageCount: json['messageCount'],
      lastMessageTime: json['lastMessageTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pharmacyName': pharmacyName,
      'pharmacyImage': pharmacyImage,
      'lastMessage': lastMessage,
      'messageCount': messageCount,
      'lastMessageTime': lastMessageTime,
    };
  }
}
