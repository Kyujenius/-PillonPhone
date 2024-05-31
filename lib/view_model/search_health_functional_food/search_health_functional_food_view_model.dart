import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/entity/health_functional_food/health_functional_food_brief_state.dart';
import 'package:pill_on_phone/type/e_health_functional_food.dart';
import 'package:pill_on_phone/utility/log_util.dart';

class SearchHealthFunctionalFoodViewModel extends GetxController {
  late final TextEditingController searchController;

  late final RxBool _isSearching;
  late final RxList<HealthFunctionalFoodBriefState> _briefs;

  bool get isSearching => _isSearching.value;
  List<HealthFunctionalFoodBriefState> get briefs => _briefs;

  @override
  void onInit() {
    super.onInit();

    searchController = TextEditingController();

    _isSearching = false.obs;
    _briefs = <HealthFunctionalFoodBriefState>[].obs;
  }

  @override
  void onClose() {
    super.onClose();

    searchController.dispose();
  }

  void searchByInputToken() async {
    LogUtil.info(searchController.text);

    _isSearching.value = true;
    await Future.delayed(const Duration(seconds: 5));
    _briefs.clear();

    _briefs.addAll(
      [
        const HealthFunctionalFoodBriefState(
          id: 1,
          name: '헬스기능식품1',
          manufacturer: '제조사1',
          imageUrl:
              "https://www.sisajournal.com/news/photo/202109/224314_132765_3240.jpg",
          type: EHealthFunctionalFood.health,
          price: 10000,
        ),
        const HealthFunctionalFoodBriefState(
          id: 2,
          name: '헬스기능식품2',
          manufacturer: '제조사2',
          imageUrl:
              "https://quabdfrttgah10486813.cdn.ntruss.com/upload/mgz/197/20231206_45584.jpg",
          type: EHealthFunctionalFood.multiVitamin,
          price: 20000,
        ),
        const HealthFunctionalFoodBriefState(
          id: 3,
          name: '헬스기능식품3',
          manufacturer: '제조사3',
          imageUrl:
              "https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/now/now00035/c/32.jpg",
          type: EHealthFunctionalFood.fatigueRecovery,
          price: 30000,
        ),
        const HealthFunctionalFoodBriefState(
          id: 1,
          name: '헬스기능식품1',
          manufacturer: '제조사1',
          imageUrl:
              "https://www.sisajournal.com/news/photo/202109/224314_132765_3240.jpg",
          type: EHealthFunctionalFood.health,
          price: 10000,
        ),
        const HealthFunctionalFoodBriefState(
          id: 2,
          name: '헬스기능식품2',
          manufacturer: '제조사2',
          imageUrl:
              "https://quabdfrttgah10486813.cdn.ntruss.com/upload/mgz/197/20231206_45584.jpg",
          type: EHealthFunctionalFood.multiVitamin,
          price: 20000,
        ),
        const HealthFunctionalFoodBriefState(
          id: 3,
          name: '헬스기능식품3',
          manufacturer: '제조사3',
          imageUrl:
              "https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/now/now00035/c/32.jpg",
          type: EHealthFunctionalFood.fatigueRecovery,
          price: 30000,
        ),
        const HealthFunctionalFoodBriefState(
          id: 1,
          name: '헬스기능식품1',
          manufacturer: '제조사1',
          imageUrl:
              "https://www.sisajournal.com/news/photo/202109/224314_132765_3240.jpg",
          type: EHealthFunctionalFood.health,
          price: 10000,
        ),
        const HealthFunctionalFoodBriefState(
          id: 2,
          name: '헬스기능식품2',
          manufacturer: '제조사2',
          imageUrl:
              "https://quabdfrttgah10486813.cdn.ntruss.com/upload/mgz/197/20231206_45584.jpg",
          type: EHealthFunctionalFood.multiVitamin,
          price: 20000,
        ),
        const HealthFunctionalFoodBriefState(
          id: 3,
          name: '헬스기능식품3',
          manufacturer: '제조사3',
          imageUrl:
              "https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/now/now00035/c/32.jpg",
          type: EHealthFunctionalFood.fatigueRecovery,
          price: 30000,
        ),
      ],
    );

    _isSearching.value = false;
  }
}
