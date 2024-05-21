import 'package:get/get.dart';
import 'package:pill_on_phone/view_model/chatting/chatting_view_model.dart';

class ChattingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChattingViewModel>(() => ChattingViewModel());
  }
}
