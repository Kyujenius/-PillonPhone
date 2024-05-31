import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pill_on_phone/config/color_system.dart';
import 'package:pill_on_phone/config/font_system.dart';
import 'package:pill_on_phone/entity/Chat/chat_model.dart';

class Chat extends StatelessWidget {
  final ChatModel chatItem;

  const Chat({super.key, required this.chatItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildChatContent(),
    );
  }

  Widget _buildChatContent() {
    switch (chatItem.messageType) {
      case MessageType.pharmacy:
        return _buildPharmacyChat();
      case MessageType.admin:
        return _buildAdminChat();
      case MessageType.user:
        return _buildUserChat();
      default:
        return const SizedBox.shrink(); // 알 수 없는 타입인 경우 아무것도 표시하지 않음
    }
  }

  Widget _buildPharmacyChat() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: ColorSystem.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    chatItem.pharmacyName.substring(0, 1),
                    // 약국 이름 첫 글자 => 향후에 사진을 바꿔야 함.
                    style: FontSystem.Sub2.copyWith(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(chatItem.pharmacyName, style: FontSystem.H3),
                    const SizedBox(height: 4),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 10), // 약국 이름/아이콘 너비만큼 왼쪽 패딩
            child: Container(
              decoration: const BoxDecoration(
                color: ColorSystem.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  chatItem.content,
                  style: FontSystem.Sub2,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(_formatTimestamp(chatItem.timestamp),
                style: FontSystem.Sub3),
          ),
        ],
      ),
    );
  }

  Widget _buildAdminChat() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Align(
        alignment: Alignment.center, // 가운데 정렬
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: ColorSystem.primary.shade100,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Text(
                "안내",
                style:
                    FontSystem.H2.copyWith(color: ColorSystem.primary.shade700),
              ),
              const SizedBox(width: 20),
              Text(
                chatItem.content,
                style: FontSystem.Sub2.copyWith(
                    color: ColorSystem.primary.shade700),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserChat() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Align(
        alignment: Alignment.centerRight, // 오른쪽 정렬
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                color: ColorSystem.secondary.shade600,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              child: Text(chatItem.content,
                  style: FontSystem.Sub2.copyWith(color: ColorSystem.white)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                _formatTimestamp(chatItem.timestamp),
                style: FontSystem.Sub3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInitChat() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Align(
        alignment: Alignment.centerRight, // 오른쪽 정렬
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: ColorSystem.secondary.shade600,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          ),
          child: Column(
            children: [
              Text("상담 요청을 보냈어요!",
                  style: FontSystem.H2.copyWith(color: ColorSystem.white)),
              const SizedBox(height: 20),
              Text("관심 있는 약",
                  style: FontSystem.H4.copyWith(color: ColorSystem.white)),
              const SizedBox(height: 10),
              //리스트 형식으로 받아올지를 모르겠음..
              const SizedBox(height: 20),
              Text("전하고 싶은 말",
                  style: FontSystem.H4.copyWith(color: ColorSystem.white)),
              Text(
                chatItem.content,
                style: FontSystem.Sub2,
              )
            ],
          ),
        ),
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    return DateFormat('HH:mm').format(timestamp);
  }
}
