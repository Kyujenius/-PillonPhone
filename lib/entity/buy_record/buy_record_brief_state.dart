import 'package:pill_on_phone/type/e_buy.dart';

class BuyRecordBriefState {
  final int id;
  final EBuy status;
  final bool isCompletedReview;
  final String pharmacyName;
  final int totalPrice;
  final DateTime createdAt;

  String get totalPriceStr => totalPrice.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match m) => '${m[1]},',
      );

  String get createdAtStr =>
      '${createdAt.year}.${createdAt.month}.${createdAt.day}';

  const BuyRecordBriefState({
    required this.id,
    required this.status,
    required this.isCompletedReview,
    required this.pharmacyName,
    required this.totalPrice,
    required this.createdAt,
  });

  BuyRecordBriefState copyWith({
    int? id,
    EBuy? status,
    bool? isCompletedReview,
    String? pharmacyName,
    int? totalPrice,
    DateTime? createdAt,
  }) {
    return BuyRecordBriefState(
      id: id ?? this.id,
      status: status ?? this.status,
      isCompletedReview: isCompletedReview ?? this.isCompletedReview,
      pharmacyName: pharmacyName ?? this.pharmacyName,
      totalPrice: totalPrice ?? this.totalPrice,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory BuyRecordBriefState.fromJson(Map<String, dynamic> json) {
    return BuyRecordBriefState(
      id: json['id'],
      status: EBuy.values[json['status']],
      isCompletedReview: json['isCompletedReview'],
      pharmacyName: json['pharmacyName'],
      totalPrice: json['totalPrice'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status.index,
      'isCompletedReview': isCompletedReview,
      'pharmacyName': pharmacyName,
      'totalPrice': totalPrice,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
