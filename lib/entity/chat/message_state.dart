import 'package:pill_on_phone/entity/health_functional_food/health_functional_food_brief_state.dart';

class MessageState {
  final int senderId; // 보낸 사람 ID
  final int receiverId; // 받는 사람 ID
  final String pharmacyName; // 약국 이름 (약국 메시지인 경우에만)
  final List<HealthFunctionalFoodBriefState>? pillList; // 약국에서 추천한 약 리스트
  final String content; // 메시지 내용
  final DateTime timestamp; // 메시지 전송 시간
  final MessageType messageType; // 메시지 종류 (약국, 운영자, 사용자)

  MessageState({
    required this.senderId,
    required this.receiverId,
    this.pharmacyName = '',
    this.pillList,
    required this.content,
    required this.timestamp,
    required this.messageType,
  });

  // copyWith 메서드
  MessageState copyWith({
    int? senderId,
    int? receiverId,
    String? pharmacyName,
    List<HealthFunctionalFoodBriefState>? pillList,
    String? content,
    DateTime? timestamp,
    MessageType? messageType,
  }) {
    return MessageState(
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
      pharmacyName: pharmacyName ?? this.pharmacyName,
      pillList :pillList ?? this.pillList,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
      messageType: messageType ?? this.messageType,
    );
  }

  factory MessageState.fromJson(Map<String, dynamic> json) {
    return MessageState(
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      pharmacyName: json['pharmacyName'] ?? '',
      pillList: json['pillList'] != null ? List<HealthFunctionalFoodBriefState>.from(json['pillList']) : null, // pillList가 null일 경우 null로 설정
      content: json['content'],
      timestamp: DateTime.parse(json['timestamp']),
      messageType: MessageType.values[json['messageType']],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'pharmacyName': pharmacyName,
      'pillList': pillList, // pillList를 그대로 포함 (null일 수도 있음)
      'content': content,
      'timestamp': timestamp.toIso8601String(),
      'messageType': messageType.index,
    };
  }
}

// 메시지 종류 Enum
enum MessageType { pharmacyBasic, pharmacyRecommend, admin, userBasic, userInit }
