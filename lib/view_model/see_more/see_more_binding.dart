import 'package:get/get.dart';
import 'package:pill_on_phone/view_model/see_more/see_more_view_model.dart';

class SeeMoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SeeMoreViewModel>(() => SeeMoreViewModel());
  }
}
