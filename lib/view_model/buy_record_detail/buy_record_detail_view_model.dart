import 'package:get/get.dart';

class BuyRecordDetailViewModel extends GetxController {
  late final int _id;

  @override
  void onInit() {
    super.onInit();

    _id = Get.arguments['id'];
  }
}
