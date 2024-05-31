import 'package:get/get.dart';
import 'package:pill_on_phone/view_model/consultation/consultation_view_model.dart';

class ConsultationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConsultationViewModel>(() => ConsultationViewModel());
  }
}
