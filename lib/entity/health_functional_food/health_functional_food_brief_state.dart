import 'package:pill_on_phone/type/e_health_functional_food.dart';

class HealthFunctionalFoodBriefState {
  final int id;
  final String name;
  final String manufacturer;
  final EHealthFunctionalFood type;
  final int price;

  const HealthFunctionalFoodBriefState({
    required this.id,
    required this.name,
    required this.manufacturer,
    required this.type,
    required this.price,
  });

  HealthFunctionalFoodBriefState copyWith({
    int? id,
    String? name,
    String? manufacturer,
    EHealthFunctionalFood? type,
    int? price,
  }) {
    return HealthFunctionalFoodBriefState(
      id: id ?? this.id,
      name: name ?? this.name,
      manufacturer: manufacturer ?? this.manufacturer,
      type: type ?? this.type,
      price: price ?? this.price,
    );
  }

  factory HealthFunctionalFoodBriefState.fromJson(Map<String, dynamic> json) {
    return HealthFunctionalFoodBriefState(
      id: json['id'] as int,
      name: json['name'] as String,
      manufacturer: json['manufacturer'] as String,
      type: EHealthFunctionalFood.values[json['type'] as int],
      price: json['price'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'manufacturer': manufacturer,
      'type': type.index,
      'price': price,
    };
  }
}
