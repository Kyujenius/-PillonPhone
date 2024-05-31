import 'package:pill_on_phone/entity/tag/health_functional_food_tag_state.dart';

enum EHealthFunctionalFood {
  all(
    koName: '전체',
    enName: 'All',
  ),
  multiVitamin(
    koName: '멀티 비타민',
    enName: 'Multi Vitamin',
  ),
  eyeHealth(
    koName: '눈 건강',
    enName: 'Eye Health',
  ),
  stress(
    koName: '스트레스',
    enName: 'Stress',
  ),
  fatigueRecovery(
    koName: '피로 회복',
    enName: 'Fatigue Recovery',
  ),
  health(
    koName: '헬스',
    enName: 'Health',
  ),
  ;

  final String koName;
  final String enName;

  const EHealthFunctionalFood({
    required this.koName,
    required this.enName,
  });

  static List<HealthFunctionalFoodTagState> get toStates =>
      EHealthFunctionalFood.values
          .map(
            (e) => HealthFunctionalFoodTagState(
              type: e,
              isSelected: EHealthFunctionalFood.all == e,
            ),
          )
          .toList();
}
