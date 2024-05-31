import 'package:pill_on_phone/type/e_pharmacy_criteria.dart';

class PharmacyCriteriaTagState {
  final EPharmacyCriteria type;
  final bool isSelected;

  PharmacyCriteriaTagState({
    required this.type,
    required this.isSelected,
  });

  PharmacyCriteriaTagState copyWith({
    EPharmacyCriteria? type,
    bool? isSelected,
  }) {
    return PharmacyCriteriaTagState(
      type: type ?? this.type,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  factory PharmacyCriteriaTagState.fromJson(Map<String, dynamic> map) {
    return PharmacyCriteriaTagState(
      type: EPharmacyCriteria.values[map['type']],
      isSelected: map['isSelected'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type.index,
      'isSelected': isSelected,
    };
  }

  factory PharmacyCriteriaTagState.fromEnum(
    EPharmacyCriteria type,
    bool isSelected,
  ) {
    return PharmacyCriteriaTagState(
      type: type,
      isSelected: isSelected,
    );
  }
}
