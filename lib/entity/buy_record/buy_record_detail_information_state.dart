import 'package:pill_on_phone/type/e_buy.dart';

class BuyRecordDetailInformationState {
  final int id;
  final EBuy status;
  final String orderNumber;
  final String orderName;
  final int totalPrice;
  final DateTime createdAt;

  String get createdAtStr =>
      '${createdAt.year}년 ${createdAt.month}월 ${createdAt.day}일 ${createdAt.hour}시 ${createdAt.minute}분';

  BuyRecordDetailInformationState({
    required this.id,
    required this.status,
    required this.orderNumber,
    required this.orderName,
    required this.totalPrice,
    required this.createdAt,
  });

  BuyRecordDetailInformationState copyWith({
    int? id,
    EBuy? status,
    String? orderNumber,
    String? orderName,
    int? totalPrice,
    DateTime? createdAt,
  }) {
    return BuyRecordDetailInformationState(
      id: id ?? this.id,
      status: status ?? this.status,
      orderNumber: orderNumber ?? this.orderNumber,
      orderName: orderName ?? this.orderName,
      totalPrice: totalPrice ?? this.totalPrice,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory BuyRecordDetailInformationState.initial() {
    return BuyRecordDetailInformationState(
      id: 0,
      status: EBuy.visitWaiting,
      orderNumber: '',
      orderName: '',
      totalPrice: 0,
      createdAt: DateTime.now(),
    );
  }

  factory BuyRecordDetailInformationState.fromMap(Map<String, dynamic> map) {
    return BuyRecordDetailInformationState(
      id: map['id'],
      status: EBuy.values[map['status']],
      orderNumber: map['orderNumber'],
      orderName: map['orderName'],
      totalPrice: map['totalPrice'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'status': status.index,
      'orderNumber': orderNumber,
      'orderName': orderName,
      'totalPrice': totalPrice,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
