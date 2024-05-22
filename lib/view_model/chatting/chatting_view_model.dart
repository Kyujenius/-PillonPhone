import 'package:get/get.dart';
import 'package:pill_on_phone/repository/chatting/chatting_repository.dart';

import '../../entity/Chat/chat_model.dart';

class ChattingViewModel extends GetxController {
  final ChattingRepository repository;

  ChattingViewModel({required this.repository});

  var chatList = <ChatListItemModel>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  void loadChatData(int userId) async {
    isLoading.value = true;
    try {
      final data = await repository.fetchChatList(userId);
      chatList.value = data;
    } catch (e) {
      errorMessage.value = '채팅을 불러오는 데에 실패했습니다!';
    } finally {
      isLoading.value = false;
    }
  }

}
