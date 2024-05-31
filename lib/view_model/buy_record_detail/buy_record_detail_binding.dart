import 'package:get/get.dart';
import 'package:pill_on_phone/view_model/buy_record_detail/buy_record_detail_view_model.dart';

class BuyRecordDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BuyRecordDetailViewModel>(() => BuyRecordDetailViewModel());
  }
}
