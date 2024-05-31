class BuyRecordDetailArticleState {
  final int id;
  final int itemId;
  final String itemName;
  final String itemManufacturer;
  final String itemImageUrl;
  final int itemPrice;

  String get itemPriceStr => itemPrice.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match m) => '${m[1]},',
      );

  const BuyRecordDetailArticleState({
    required this.id,
    required this.itemId,
    required this.itemName,
    required this.itemManufacturer,
    required this.itemImageUrl,
    required this.itemPrice,
  });

  BuyRecordDetailArticleState copyWith({
    int? id,
    int? itemId,
    String? itemName,
    String? itemManufacturer,
    String? itemImageUrl,
    int? itemPrice,
  }) {
    return BuyRecordDetailArticleState(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      itemName: itemName ?? this.itemName,
      itemManufacturer: itemManufacturer ?? this.itemManufacturer,
      itemImageUrl: itemImageUrl ?? this.itemImageUrl,
      itemPrice: itemPrice ?? this.itemPrice,
    );
  }

  factory BuyRecordDetailArticleState.fromJson(Map<String, dynamic> json) {
    return BuyRecordDetailArticleState(
      id: json['id'],
      itemId: json['itemId'],
      itemName: json['itemName'],
      itemManufacturer: json['itemManufacturer'],
      itemImageUrl: json['itemImageUrl'],
      itemPrice: json['itemPrice'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'itemId': itemId,
      'itemName': itemName,
      'itemManufacturer': itemManufacturer,
      'itemImageUrl': itemImageUrl,
      'itemPrice': itemPrice,
    };
  }
}
