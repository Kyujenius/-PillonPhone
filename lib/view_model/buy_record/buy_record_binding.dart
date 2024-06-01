import 'package:get/get.dart';
import 'package:pill_on_phone/view_model/buy_record/buy_record_view_model.dart';

class BuyRecordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BuyRecordViewModel>(() => BuyRecordViewModel());
  }
}
