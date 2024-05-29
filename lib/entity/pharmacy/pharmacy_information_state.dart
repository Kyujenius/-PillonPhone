class PharmacyBriefState {
  final int id;
  final String name;
  final String address;
  final String imageUrl;
  final double reviewScore;
  final int reviewCount;

  PharmacyBriefState({
    required this.id,
    required this.name,
    required this.address,
    required this.imageUrl,
    required this.reviewScore,
    required this.reviewCount,
  });

  PharmacyBriefState copyWith({
    int? id,
    String? name,
    String? address,
    String? imageUrl,
    double? reviewScore,
    int? reviewCount,
  }) {
    return PharmacyBriefState(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      imageUrl: imageUrl ?? this.imageUrl,
      reviewScore: reviewScore ?? this.reviewScore,
      reviewCount: reviewCount ?? this.reviewCount,
    );
  }

  factory PharmacyBriefState.fromJson(Map<String, dynamic> map) {
    return PharmacyBriefState(
      id: map['id'],
      name: map['name'],
      address: map['address'],
      imageUrl: map['imageUrl'],
      reviewScore: map['reviewScore'],
      reviewCount: map['reviewCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'imageUrl': imageUrl,
      'reviewScore': reviewScore,
      'reviewCount': reviewCount,
    };
  }
}
