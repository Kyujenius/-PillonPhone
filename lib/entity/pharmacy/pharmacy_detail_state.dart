class PharmacyInformationState {
  final int id;
  final String name;
  final String description;
  final String address;
  final String imageUrl;
  final double reviewScore;
  final int reviewCount;

  final String pharmacistName;
  final String pharmacistImageUrl;

  PharmacyInformationState({
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    required this.imageUrl,
    required this.reviewScore,
    required this.reviewCount,
    required this.pharmacistName,
    required this.pharmacistImageUrl,
  });

  PharmacyInformationState copyWith({
    int? id,
    String? name,
    String? description,
    String? address,
    String? imageUrl,
    double? reviewScore,
    int? reviewCount,
    String? pharmacistName,
    String? pharmacistImageUrl,
  }) {
    return PharmacyInformationState(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      address: address ?? this.address,
      imageUrl: imageUrl ?? this.imageUrl,
      reviewScore: reviewScore ?? this.reviewScore,
      reviewCount: reviewCount ?? this.reviewCount,
      pharmacistName: pharmacistName ?? this.pharmacistName,
      pharmacistImageUrl: pharmacistImageUrl ?? this.pharmacistImageUrl,
    );
  }

  factory PharmacyInformationState.initial() {
    return PharmacyInformationState(
      id: 0,
      name: '',
      description: '',
      address: '',
      imageUrl: '',
      reviewScore: 0,
      reviewCount: 0,
      pharmacistName: '',
      pharmacistImageUrl: '',
    );
  }

  factory PharmacyInformationState.fromJson(Map<String, dynamic> json) {
    return PharmacyInformationState(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      address: json['address'],
      imageUrl: json['imageUrl'],
      reviewScore: json['reviewScore'],
      reviewCount: json['reviewCount'],
      pharmacistName: json['pharmacistName'],
      pharmacistImageUrl: json['pharmacistImageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'address': address,
      'imageUrl': imageUrl,
      'reviewScore': reviewScore,
      'reviewCount': reviewCount,
      'pharmacistName': pharmacistName,
      'pharmacistImageUrl': pharmacistImageUrl,
    };
  }
}
