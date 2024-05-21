import 'package:get/get.dart';
import 'package:pill_on_phone/view_model/root/root_view_model.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootViewModel>(() => RootViewModel());
  }
}
