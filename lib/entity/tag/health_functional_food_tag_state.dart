import 'package:pill_on_phone/type/e_health_functional_food.dart';

class HealthFunctionalFoodTagState {
  final EHealthFunctionalFood type;
  final bool isSelected;

  HealthFunctionalFoodTagState({
    required this.type,
    required this.isSelected,
  });

  HealthFunctionalFoodTagState copyWith({
    EHealthFunctionalFood? type,
    bool? isSelected,
  }) {
    return HealthFunctionalFoodTagState(
      type: type ?? this.type,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  factory HealthFunctionalFoodTagState.fromJson(Map<String, dynamic> map) {
    return HealthFunctionalFoodTagState(
      type: EHealthFunctionalFood.values[map['type']],
      isSelected: map['isSelected'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type.index,
      'isSelected': isSelected,
    };
  }

  factory HealthFunctionalFoodTagState.fromEnum(
    EHealthFunctionalFood type,
    bool isSelected,
  ) {
    return HealthFunctionalFoodTagState(
      type: type,
      isSelected: isSelected,
    );
  }
}
