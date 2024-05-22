import 'package:flutter/material.dart';
import 'package:pill_on_phone/config/color_system.dart';
import 'package:pill_on_phone/config/font_system.dart';
import '../../../entity/Chat/chat_model.dart';

class ChatListItem extends StatelessWidget {
  final ChatListItemModel chatItem;

  const ChatListItem({super.key, required this.chatItem});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // 채팅방 들어가기 함수
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                width: 88,
                height: 88,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(chatItem.pharmacyImage ?? ''),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),


            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chatItem.pharmacyName ?? '약국 이름',
                    style: FontSystem.H3,
                  ),
                  const SizedBox(height: 4),

                  Text(
                    chatItem.lastMessage,
                    style: FontSystem.Sub2,
                    overflow: TextOverflow.ellipsis,
                    //넘쳤을 때 체크
                  ),
                ],
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  chatItem.lastMessageTime,
                  style: FontSystem.Sub2.copyWith(
                    color: ColorSystem.neutral
                  ),
                ),
                const SizedBox(height: 4),
                if (chatItem.messageCount > 0)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: ColorSystem.primary.shade500,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      '${chatItem.messageCount}+',
                      style: FontSystem.Sub1,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
