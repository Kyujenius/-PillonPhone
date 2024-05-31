import 'package:get/get.dart';

class SeeMoreViewModel extends GetxController {
  late final RxString _nickname;

  String get nickname => _nickname.value;

  @override
  void onInit() {
    super.onInit();

    _nickname = ''.obs;

    _fetchNickname();
  }

  void _fetchNickname() {
    _nickname.value = '홍길동';
  }
}
