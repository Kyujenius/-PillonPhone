import 'package:pill_on_phone/type/e_health_functional_food.dart';

class HealthFunctionalFoodBriefState {
  final int id;
  final String name;
  final String manufacturer;
  final String imageUrl;
  final EHealthFunctionalFood type;
  final int price;

  const HealthFunctionalFoodBriefState({
    required this.id,
    required this.name,
    required this.manufacturer,
    required this.type,
    required this.imageUrl,
    required this.price,
  });

  HealthFunctionalFoodBriefState copyWith({
    int? id,
    String? name,
    String? manufacturer,
    EHealthFunctionalFood? type,
    String? imageUrl,
    int? price,
  }) {
    return HealthFunctionalFoodBriefState(
      id: id ?? this.id,
      name: name ?? this.name,
      manufacturer: manufacturer ?? this.manufacturer,
      imageUrl: imageUrl ?? this.imageUrl,
      type: type ?? this.type,
      price: price ?? this.price,
    );
  }

  factory HealthFunctionalFoodBriefState.fromJson(Map<String, dynamic> json) {
    return HealthFunctionalFoodBriefState(
      id: json['id'] as int,
      name: json['name'] as String,
      manufacturer: json['manufacturer'] as String,
      imageUrl: json['imageUrl'] as String,
      type: EHealthFunctionalFood.values[json['type'] as int],
      price: json['price'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'manufacturer': manufacturer,
      'imageUrl': imageUrl,
      'type': type.index,
      'price': price,
    };
  }
}
