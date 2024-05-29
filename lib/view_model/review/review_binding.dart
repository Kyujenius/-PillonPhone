import 'package:get/get.dart';
import 'package:pill_on_phone/view_model/review/review_view_model.dart';

class ReviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReviewViewModel>(() => ReviewViewModel());
  }
}
