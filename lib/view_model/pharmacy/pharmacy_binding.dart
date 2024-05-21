import 'package:get/get.dart';
import 'package:pill_on_phone/view_model/pharmacy/pharmacy_view_model.dart';

class PharmacyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PharmacyViewModel>(() => PharmacyViewModel());
  }
}
