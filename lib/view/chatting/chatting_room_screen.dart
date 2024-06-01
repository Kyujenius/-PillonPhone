import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/config/color_system.dart';
import 'package:pill_on_phone/config/font_system.dart';
import 'package:pill_on_phone/view/base/base_screen.dart';
import 'package:pill_on_phone/view/chatting/widget/chat_widget.dart';
import 'package:pill_on_phone/view_model/chatting/chatting_view_model.dart';
import 'package:pill_on_phone/widget/app_bar/chatting_app_bar.dart';
import 'package:pill_on_phone/widget/button/custom_icon_button.dart';
import 'package:pill_on_phone/widget/button/smaill_custom_icon_button.dart';

class ChattingScreen extends BaseScreen<ChattingViewModel> {
  const ChattingScreen({super.key});

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: ChattingAppBar(
          title: '약알 약국',
          backgroundColor: ColorSystem.neutral.shade50,
          actions: [
            SmallCustomIconButton(
              assetPath: "assets/icons/leaving_chatting.svg",
              onPressed: () {
                // 나가기 동작 구현
                Get.bottomSheet(_showLeaveChatConfirmation(context));
              },
            ),
          ],
          onBackPress: Get.back,
        ));
  }


  @override
  Widget buildBody(BuildContext context) {
    viewModel.loadChats(1);

    return Container(
      color: ColorSystem.secondary.shade50,
      child: Column(
        children: [
          chats(),
          chattingInput(),
          // 채팅 치는 곳
        ],
      ),
    );
  }

  Widget chats() => Expanded(
        child: Obx(() {
          if (viewModel.isChatLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else if (viewModel.errorMessage.isNotEmpty) {
            return Center(child: Text(viewModel.errorMessage.value));
          } else {
            return ListView.builder(
              itemCount: viewModel.chats.length,
              itemBuilder: (context, index) {
                final chat = viewModel.chats[index];
                return Column(
                  children: [
                    Chat(chatItem: chat),
                    const SizedBox(height: 20,)
                  ],
                );
              },
            );
          }
        }),
      );

  Widget chattingInput() => Container(
        padding: const EdgeInsets.only(
          top: 20,
          left: 10,
          right: 10,
          bottom: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, -2),
              blurRadius: 4,
            ),
          ],
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: ColorSystem.neutral.shade50,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: TextField(
                    controller: viewModel.textEditingController,
                    style: FontSystem.Sub2,
                    decoration: InputDecoration(
                      hintText: '궁금한 것을 물어보세요',
                      hintStyle: FontSystem.Sub2.copyWith(
                          color: ColorSystem.neutral.shade500),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            CustomIconButton(
              assetPath: 'assets/icons/send.svg', // 실제 asset 경로로 변경
              onPressed: () {
                viewModel.onSendMessage();
              },
            ),
          ],
        ),
      );

  Widget _showLeaveChatConfirmation(BuildContext context) {
    return Container(
      height: 330, // 모달창 높이 조절
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorSystem.error.shade50,
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(Icons.delete_outline,
                  size: 50, color: ColorSystem.error),
            ),
          ), // 아이콘 변경 가능
          const SizedBox(height: 10),
          const Text('채팅방을 나갈까요?', style: FontSystem.H2),
          const SizedBox(height: 10),
          Text('모든 채팅 기록이 삭제됩니다.',
              style:
                  FontSystem.H5.copyWith(color: ColorSystem.neutral.shade500)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // 나가기 버튼 로직 처리
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150, 62),
                      backgroundColor: ColorSystem.neutral.shade100),
                  child: const Text('취소', style: FontSystem.H2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // 나가기 버튼 로직 처리
                    Get.back();
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150, 62),
                      backgroundColor: ColorSystem.error.shade400),
                  child: Text('나가기',
                      style: FontSystem.H2.copyWith(color: ColorSystem.white)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
