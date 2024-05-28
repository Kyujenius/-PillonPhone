import 'package:pill_on_phone/type/e_pharmacy_criteria.dart';

class TagState {
  final EPharmacyCriteria criteria;
  final bool isSelected;

  TagState({
    required this.criteria,
    required this.isSelected,
  });

  TagState copyWith({
    EPharmacyCriteria? criteria,
    bool? isSelected,
  }) {
    return TagState(
      criteria: criteria ?? this.criteria,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  factory TagState.fromJson(Map<String, dynamic> map) {
    return TagState(
      criteria: EPharmacyCriteria.values[map['criteria']],
      isSelected: map['isSelected'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'criteria': criteria.index,
      'isSelected': isSelected,
    };
  }

  factory TagState.fromCriteria(
    EPharmacyCriteria criteria,
    bool isSelected,
  ) {
    return TagState(
      criteria: criteria,
      isSelected: isSelected,
    );
  }
}
