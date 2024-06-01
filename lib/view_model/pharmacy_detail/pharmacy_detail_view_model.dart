import 'package:get/get.dart';
import 'package:pill_on_phone/entity/health_functional_food/health_functional_food_brief_state.dart';
import 'package:pill_on_phone/entity/pharmacy/pharmacy_detail_state.dart';
import 'package:pill_on_phone/entity/tag/health_functional_food_tag_state.dart';
import 'package:pill_on_phone/type/e_health_functional_food.dart';

class PharmacyDetailViewModel extends GetxController {
  late final int _id;

  late final Rx<PharmacyInformationState> _information;
  late final RxList<HealthFunctionalFoodTagState> _tags;
  late final RxList<HealthFunctionalFoodBriefState> _briefs;

  PharmacyInformationState get information => _information.value;
  List<HealthFunctionalFoodTagState> get tags => _tags;
  List<HealthFunctionalFoodBriefState> get briefs => _briefs;

  @override
  void onInit() {
    super.onInit();

    _id = Get.arguments['id'];

    _information = PharmacyInformationState.initial().obs;
    _tags = EHealthFunctionalFood.toStates.obs;
    _briefs = <HealthFunctionalFoodBriefState>[].obs;

    _fetchInformation();
    _fetchHealthFunctionalFoodBriefs();
  }

  void _fetchInformation() {
    _information.value = PharmacyInformationState(
      id: 1,
      name: '약알 의국',
      description: '약알 약국은 약국입니다.',
      address: '서울특별시 강남구 역삼동 123-45',
      imageUrl:
          'https://file.mk.co.kr/meet/neds/2020/09/image_readtop_2020_938058_15997251674351551.jpg',
      reviewScore: 4.5,
      reviewCount: 78,
      pharmacistName: '앗살라',
      pharmacistImageUrl:
          'https://cdn.pharmnews.com/news/photo/202310/232333_105608_115.jpg',
    );
  }

  void _fetchHealthFunctionalFoodBriefs() {
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
  }

  Future<bool> fetchSelectedTag(EHealthFunctionalFood type) async {
    final index = _tags.indexWhere((tag) => tag.type == type);

    if (_tags[index].isSelected) {
      return false;
    }

    /// Deselect all tags except the selected tag
    for (int i = 0; i < _tags.length; i++) {
      if (i != index && _tags[i].isSelected) {
        _tags[i] = _tags[i].copyWith(
          isSelected: false,
        );
      }
    }

    /// Select the selected tag
    if (index != -1) {
      _tags[index] = _tags[index].copyWith(
        isSelected: !_tags[index].isSelected,
      );
    }

    return true;
  }
}
