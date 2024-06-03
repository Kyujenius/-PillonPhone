import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/entity/Chat/message_list_state.dart';
import 'package:pill_on_phone/entity/Chat/message_state.dart';
import 'package:pill_on_phone/entity/health_functional_food/health_functional_food_brief_state.dart';
import 'package:pill_on_phone/type/e_health_functional_food.dart';

class ChattingViewModel extends GetxController {
  late final RxList<MessageListState> messageList;
  late final RxBool isMessageListLoading;
  late final RxString errorMessage;

  late final RxList<MessageState> messages;
  late final RxBool isMessageLoading;

  late final TextEditingController textEditingController;
  late final RxString inputMessage;

  @override
  void onInit() {
    super.onInit();
    messageList = <MessageListState>[].obs;
    isMessageListLoading = false.obs;
    errorMessage = ''.obs;

    messages = <MessageState>[].obs;
    isMessageLoading = false.obs;

    textEditingController = TextEditingController();
    inputMessage = ''.obs;
  }

  void onSendMessage() {
    //입력된 메시지(inputMessage.value)를 서버로 전송하는 로직 추가
    textEditingController.clear(); // 입력창 초기화
  }

  void loadChatList(int userId) async {
    isMessageListLoading.value = true;
    try {
      // final data = await repository.fetchChatList(userId);
      final data = dummyChatList;
      messageList.value = data;
    } catch (e) {
      errorMessage.value = '채팅을 불러오는 데에 실패했습니다!';
    } finally {
      isMessageListLoading.value = false;
    }
  }

  void loadChats(int chatId) async {
    isMessageLoading.value = true;
    try {
      // final data = await repository.fetchChats(chatId);
      final data = dummyChatMessages; // 예시 데이터
      messages.value = data;
    } catch (e) {
      errorMessage.value = '채팅 메시지를 불러오는 데에 실패했습니다!';
    } finally {
      isMessageLoading.value = false;
    }
  }

  // 예시 채팅 메시지 데이터
  final dummyChatMessages = [
    MessageState(
        senderId: 1,
        receiverId: 1,
        content: '제가 이 영양제들을 사고싶은데 뭐가 좋을까요??',
        timestamp: DateTime.now(),
        pillList: [
          const HealthFunctionalFoodBriefState(
            id: 1,
            name: '헬스기능식품1',
            manufacturer: '제조사1',
            imageUrl:
            "https://www.sisajournal.com/news/photo/202109/224314_132765_3240.jpg",
            type: EHealthFunctionalFood.health,
            price: 10000,
          ),
          const HealthFunctionalFoodBriefState(
            id: 2,
            name: '헬스기능식품2',
            manufacturer: '제조사2',
            imageUrl:
            "https://quabdfrttgah10486813.cdn.ntruss.com/upload/mgz/197/20231206_45584.jpg",
            type: EHealthFunctionalFood.multiVitamin,
            price: 20000,
          )
        ],
        // pillList 초기화
        messageType: MessageType.userInit),
    MessageState(
      senderId: 1,
      receiverId: 1,
      content: '약국이 채팅을 승낙했습니다!\n이제부터 채팅이 가능합니다.',
      timestamp: DateTime.now(),
      messageType: MessageType.admin,
    ),
    MessageState(
        senderId: 1,
        receiverId: 1,
        content: '',
        timestamp: DateTime.now(),
        pharmacyName: '약알 약국',
        pillList: [
          const HealthFunctionalFoodBriefState(
            id: 1,
            name: '헬스기능식품1',
            manufacturer: '제조사1',
            imageUrl:
                "https://www.sisajournal.com/news/photo/202109/224314_132765_3240.jpg",
            type: EHealthFunctionalFood.health,
            price: 10000,
          ),
          const HealthFunctionalFoodBriefState(
            id: 2,
            name: '헬스기능식품2',
            manufacturer: '제조사2',
            imageUrl:
                "https://quabdfrttgah10486813.cdn.ntruss.com/upload/mgz/197/20231206_45584.jpg",
            type: EHealthFunctionalFood.multiVitamin,
            price: 20000,
          )
        ],
        // pillList 초기화
        messageType: MessageType.pharmacyRecommend),
    MessageState(
      senderId: 1,
      receiverId: 1,
      pharmacyName: '약알 약국',
      content: '안녕하세요. 문의하신 내용 답변드립니다. 이와 같은 약들이 좋을 것으로 보입니다!',
      timestamp: DateTime.now(),
      messageType: MessageType.pharmacyBasic,
    ),
    MessageState(
      senderId: 1,
      receiverId: 1,
      content: '네, 감사합니다.',
      timestamp: DateTime.now(),
      messageType: MessageType.userBasic,
    ),
  ];

  final dummyChatList = [
    MessageListState(
      id: 1,
      pharmacyName: "약알 약국",
      pharmacyImage:
          'https://cdn.pixabay.com/photo/2014/06/03/19/38/board-361516_640.jpg',
      lastMessage: '마지막 메시지!',
      messageCount: 99,
      lastMessageTime: '09:41 PM',
    ),
    MessageListState(
      id: 2,
      pharmacyName: "약알 약국",
      pharmacyImage:
          'https://cdn.pixabay.com/photo/2014/06/03/19/38/board-361516_640.jpg',
      lastMessage: '마지막 메시지!',
      messageCount: 99,
      lastMessageTime: '09:41 PM',
    ),
  ];

// ... (dummyChatList는 동일)
}
