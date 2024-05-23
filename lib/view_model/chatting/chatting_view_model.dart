import 'package:get/get.dart';

import '../../entity/Chat/chat_model.dart';

class ChattingViewModel extends GetxController {
  ChattingViewModel();

  var chatList = <ChatListItemModel>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  void loadChatData(int userId) async {
    isLoading.value = true;
    try {
      // final data = await repository.fetchChatList(userId);
      final data = dummy_chat_list;
      chatList.value = data;
    } catch (e) {
      errorMessage.value = '채팅을 불러오는 데에 실패했습니다!';
    } finally {
      isLoading.value = false;
    }
  }

  final dummy_chat_list = [
  ChatListItemModel(
  pharmacyName: "약알 약국",
  pharmacyImage: 'https://cdn.pixabay.com/photo/2014/06/03/19/38/board-361516_640.jpg',
  lastMessage: '마지막 메시지!',
  messageCount: 99,
  lastMessageTime: '09:41 PM',
  ),
  ChatListItemModel(
  pharmacyName: "약알 약국",
  pharmacyImage: 'https://cdn.pixabay.com/photo/2014/06/03/19/38/board-361516_640.jpg',
  lastMessage: '마지막 메시지!',
  messageCount: 99,
  lastMessageTime: '09:41 PM',
  ),
  ];
}
