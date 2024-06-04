import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/view/base/base_screen.dart';
import 'package:pill_on_phone/view/chatting_list/widget/chatting_list_item_view.dart';
import 'package:pill_on_phone/view_model/chatting/chatting_view_model.dart';
import 'package:pill_on_phone/widget/app_bar/default_app_bar.dart';

class ChattingListScreen extends BaseScreen<ChattingViewModel> {
  const ChattingListScreen({super.key});

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: DefaultAppBar(
          title: '채팅 리스트',
        ));
  }

  @override
  Widget buildBody(BuildContext context) {
    viewModel.loadChatList(0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Obx(() {
            if (viewModel.isMessageListLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else if (viewModel.errorMessage.isNotEmpty) {
              return Center(child: Text(viewModel.errorMessage.value));
            } else {
              return ListView.builder(
                itemCount: viewModel.messageList.length,
                itemBuilder: (context, index) {
                  final chatList = viewModel.messageList[index];
                  return ChattingListItemView(messageListState: chatList);
                },
              );
            }
          }),
        ),
      ],
    );
  }
}
