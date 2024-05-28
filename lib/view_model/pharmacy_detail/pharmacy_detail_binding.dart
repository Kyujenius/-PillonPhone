import 'package:get/get.dart';
import 'package:pill_on_phone/view_model/pharmacy_detail/pharmacy_detail_view_model.dart';

class PharmacyDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PharmacyDetailViewModel>(() => PharmacyDetailViewModel());
  }
}
