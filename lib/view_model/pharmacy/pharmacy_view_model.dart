import 'package:get/get.dart';
import 'package:pill_on_phone/entity/pharmacy/pharmacy_information_state.dart';
import 'package:pill_on_phone/entity/tag/pharmacy_criteria_tag_state.dart';
import 'package:pill_on_phone/type/e_pharmacy_criteria.dart';

class PharmacyViewModel extends GetxController {
  late final RxList<PharmacyCriteriaTagState> _tags;
  late final RxList<PharmacyBriefState> _pharmacyBriefs;

  List<PharmacyCriteriaTagState> get tags => _tags;
  List<PharmacyBriefState> get pharmacyBriefs => _pharmacyBriefs;

  @override
  void onInit() {
    super.onInit();

    _tags = EPharmacyCriteria.values
        .map((criteria) => PharmacyCriteriaTagState.fromEnum(
              criteria,
              criteria == EPharmacyCriteria.all,
            ))
        .toList()
        .obs;

    _pharmacyBriefs = List.generate(
      10,
      (index) => PharmacyBriefState(
        id: index,
        name: '약국 $index',
        address: '서울시 강남구 역삼동',
        imageUrl: 'https://picsum.photos/200/300',
        reviewScore: 4.0 + index * 0.1,
        reviewCount: 95 + index,
      ),
    ).obs;
  }

  /// Fetch selected tag
  Future<bool> fetchSelectedTag(EPharmacyCriteria criteria) async {
    final index = _tags.indexWhere((tag) => tag.type == criteria);

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
