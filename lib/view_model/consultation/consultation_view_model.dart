import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/utility/log_util.dart';

class ConsultationViewModel extends GetxController {
  late final TextEditingController contentController;

  late final RxBool _isCompleteButtonEnabled;

  bool get isCompleteButtonEnabled => _isCompleteButtonEnabled.value;

  @override
  void onInit() {
    super.onInit();

    contentController = TextEditingController();

    _isCompleteButtonEnabled = false.obs;
  }

  @override
  void onClose() {
    super.onClose();

    contentController.dispose();
  }

  Future<bool> onClickCompleteButton() async {
    await Future.delayed(const Duration(milliseconds: 500));

    LogUtil.info('onClickCompleteButton ${contentController.text}');

    return true;
  }

  void onContentChanged(String value) {
    _isCompleteButtonEnabled.value = value.length >= 10;
  }
}
