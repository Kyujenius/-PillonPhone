import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/config/color_system.dart';
import 'package:pill_on_phone/config/font_system.dart';
import 'package:pill_on_phone/view/base/base_screen.dart';
import 'package:pill_on_phone/view/chatting/widget/chat_widget.dart';
import 'package:pill_on_phone/view_model/chatting/chatting_view_model.dart';

class ChattingScreen extends BaseScreen<ChattingViewModel> {
  const ChattingScreen({super.key});

  @override
  Widget buildBody(BuildContext context) {
    viewModel.loadChats(1);

    return Container(
      color: ColorSystem.secondary.shade50,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0),
            child: Text(
              "채팅방",
              style: FontSystem.H1,
            ),
          ),
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
                return Chat(chatItem: chat);
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
          bottom: 180, // bottomNavigationBar의 높이만큼 패딩 추가
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
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                viewModel.onSendMessage();
              },
            ),
          ],
        ),
      );
}
