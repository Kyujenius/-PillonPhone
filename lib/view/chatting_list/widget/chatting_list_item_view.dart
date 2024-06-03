import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/config/app_routes.dart';
import 'package:pill_on_phone/config/color_system.dart';
import 'package:pill_on_phone/config/font_system.dart';
import 'package:pill_on_phone/entity/Chat/message_list_state.dart';

class ChattingListItemView extends StatelessWidget {
  final MessageListState messageListState;

  const ChattingListItemView({super.key, required this.messageListState});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // 채팅방 들어가기 함수
        Get.toNamed(AppRoutes.CHATTING);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            pharmacyImage(),
            const SizedBox(width: 16),
            pharmacyNameNLastMessage(),
            pharmacyLastMessageTimeNMessageCount(),
          ],
        ),
      ),
    );
  }

  Widget pharmacyImage() => ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          width: 88,
          height: 88,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(messageListState.pharmacyImage ?? ''),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );

  Widget pharmacyNameNLastMessage() => Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              messageListState.pharmacyName ?? '약국 이름',
              style: FontSystem.H3,
            ),
            const SizedBox(height: 4),
            Text(
              messageListState.lastMessage,
              style: FontSystem.Sub2,
              overflow: TextOverflow.ellipsis,
              //넘쳤을 때 체크
            ),
          ],
        ),
      );

  Widget pharmacyLastMessageTimeNMessageCount() => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            messageListState.lastMessageTime,
            style: FontSystem.Sub2.copyWith(color: ColorSystem.neutral),
          ),
          const SizedBox(height: 4),
          if (messageListState.messageCount > 0)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: ColorSystem.primary.shade500,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                '${messageListState.messageCount}+',
                style: FontSystem.Sub1,
              ),
            ),
        ],
      );
}
