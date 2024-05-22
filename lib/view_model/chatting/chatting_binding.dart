import 'package:get/get.dart';
import 'package:pill_on_phone/view_model/chatting/chatting_view_model.dart';
import 'package:pill_on_phone/repository/chatting/chatting_repository.dart'; // Import your repository
import 'package:pill_on_phone/provider/Chatting/chatting_provider.dart';

class ChattingBinding extends Bindings {
  @override
  void dependencies() {
    // Create and register the provider (if you are using a provider)
    Get.lazyPut<ChattingProvider>(() => ChattingProvider());

    // Create and register the repository
    Get.lazyPut<ChattingRepository>(
            () => ChattingRepository(chattingProvider: Get.find()));

    // Now create and register the view model with the repository dependency
    Get.lazyPut<ChattingViewModel>(() => ChattingViewModel(repository: Get.find()));
  }
}