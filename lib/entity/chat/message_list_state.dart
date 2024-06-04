class MessageListState {
  final int id;
  final String pharmacyName;
  final String? pharmacyImage;
  final String lastMessage;
  final int messageCount;
  final String lastMessageTime;

  MessageListState({
    required this.id,
    required this.pharmacyName,
    this.pharmacyImage,
    required this.lastMessage,
    required this.messageCount,
    required this.lastMessageTime,
  });

  MessageListState copyWith({
    int? id,
    String? pharmacyName,
    String? pharmacyImage,
    String? lastMessage,
    int? messageCount,
    String? lastMessageTime,
  }) {
    return MessageListState(
      id: id ?? this.id,
      pharmacyName: pharmacyName ?? this.pharmacyName,
      pharmacyImage: pharmacyImage ?? this.pharmacyImage,
      lastMessage: lastMessage ?? this.lastMessage,
      messageCount: messageCount ?? this.messageCount,
      lastMessageTime: lastMessageTime ?? this.lastMessageTime,
    );
  }

  factory MessageListState.fromJson(Map<String, dynamic> json) {
    return MessageListState(
      id: json['id'],
      pharmacyName: json['pharmacyName'],
      pharmacyImage: json['pharmacyImage'],
      lastMessage: json['lastMessage'],
      messageCount: json['messageCount'],
      lastMessageTime: json['lastMessageTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pharmacyName': pharmacyName,
      'pharmacyImage': pharmacyImage,
      'lastMessage': lastMessage,
      'messageCount': messageCount,
      'lastMessageTime': lastMessageTime,
    };
  }
}
