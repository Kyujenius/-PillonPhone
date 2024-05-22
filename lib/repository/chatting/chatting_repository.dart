import 'package:get/get.dart'; // Import GetX for dependency injection
import 'package:pill_on_phone/entity/Chat/chat_model.dart';
import 'package:pill_on_phone/provider/Chatting/chatting_provider.dart'; // If still using

class ChattingRepository extends GetxService {


  final ChattingProvider _chattingProvider;

  ChattingRepository({required ChattingProvider chattingProvider})
      : _chattingProvider = chattingProvider;

  Future<List<ChatListItemModel>> fetchChatList(int userId) async {
    // List<dynamic> data =
    //     await _chattingProvider.getChatListByUserId(userId);
    // 현재는 사용 안 하니까 DUMMY로 사용 안 됐을 때 오류 창 확인
    return [
      ChatListItemModel(
        pharmacyName: "약알 약국",
        pharmacyImage: 'https://cdn.pixabay.com/photo/2014/06/03/19/38/board-361516_640.jpg',
        lastMessage: '마지막 메시지!',
        messageCount: 99,
        lastMessageTime: '10:00 AM',
      ),
      ChatListItemModel(
        pharmacyName: "약알 약국",
        pharmacyImage: 'https://cdn.pixabay.com/photo/2014/06/03/19/38/board-361516_640.jpg',
        lastMessage: '마지막 메시지!',
        messageCount: 99,
        lastMessageTime: '10:00 AM',
      ),
    ];
  }

}