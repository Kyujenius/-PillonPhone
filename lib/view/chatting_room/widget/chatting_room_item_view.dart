import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pill_on_phone/config/color_system.dart';
import 'package:pill_on_phone/config/font_system.dart';
import 'package:pill_on_phone/entity/Chat/message_state.dart';
import 'package:pill_on_phone/widget/box/image_box.dart';

class ChattingRoomItemView extends StatelessWidget {
  final MessageState message;

  const ChattingRoomItemView({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildChatContent(),
    );
  }

  Widget _buildChatContent() {
    switch (message.messageType) {
      case MessageType.pharmacyBasic:
        return _buildPharmacyChat();
      case MessageType.pharmacyRecommend:
        return _buildPharmacyRecommendChat();
      case MessageType.admin:
        return _buildAdminChat();
      case MessageType.userBasic:
        return _buildUserChat();
      case MessageType.userInit:
        return _buildUserInitChat();
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
                    message.pharmacyName.substring(0, 1),
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
                    Text(message.pharmacyName, style: FontSystem.H3),
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
                  message.content,
                  style: FontSystem.Sub2,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(_formatTimestamp(message.timestamp),
                style: FontSystem.Sub3),
          ),
        ],
      ),
    );
  }

  Widget _buildPharmacyRecommendChat() {
    if (message.pillList == null || message.pillList!.isEmpty) {
      return Container();
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
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
                    message.pharmacyName.substring(0, 1),
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
                    Text(message.pharmacyName, style: FontSystem.H3),
                    const SizedBox(height: 4),
                  ],
                ),
              ),
            ],
          ),
          // ListView.builder를 사용하여 추천 약 목록 표시
          Container(
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorSystem.white),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text('추천 목록',
                    style: FontSystem.H2
                        .copyWith(color: ColorSystem.neutral.shade800)),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: message.pillList!.length,
                  itemBuilder: (context, index) {
                    final pill = message.pillList![index];
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ImageBox(
                                width: 90,
                                height: 90,
                                borderRadius: BorderRadius.circular(20),
                                imageUrl: pill.imageUrl,
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(pill.name,
                                        style: FontSystem.H4.copyWith(
                                            color:
                                                ColorSystem.neutral.shade800)),
                                    const SizedBox(height: 5),
                                    Text(
                                      pill.manufacturer,
                                      style: FontSystem.Sub2.copyWith(
                                        color: ColorSystem.neutral.shade500,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                        "${pill.price.toString().replaceAllMapped(
                                              RegExp(
                                                  r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                              (Match m) => '${m[1]},',
                                            )}원",
                                        style: FontSystem.H2),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Builder(builder: (context) {
                  return ElevatedButton(
                    onPressed: () {
                      Get.bottomSheet(_showBuyingConfirmation(context));
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(300, 62),
                        backgroundColor: ColorSystem.primary.shade500),
                    child: Text('구매하기',
                        style:
                            FontSystem.H2.copyWith(color: ColorSystem.white)),
                  );
                }),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
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
                message.content,
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
              child: Text(message.content,
                  style: FontSystem.Sub2.copyWith(color: ColorSystem.white)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                _formatTimestamp(message.timestamp),
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
          width: 300,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: ColorSystem.secondary.shade600,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // 텍스트 왼쪽 정렬 추가
            children: [
              Text("상담 요청을 보냈어요!",
                  style: FontSystem.H2.copyWith(color: ColorSystem.white)),
              const SizedBox(height: 20),
              Text("관심 있는 약",
                  style: FontSystem.H4.copyWith(color: ColorSystem.white)),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true, // ListView 크기를 내용에 맞게 조절
                physics: const NeverScrollableScrollPhysics(), // 스크롤 방지
                itemCount: message.pillList!.length,
                itemBuilder: (context, index) {
                  return Text(
                    '${index + 1}. ${message.pillList![index].name}',
                    // 숫자와 약 이름 표시
                    style: FontSystem.Sub2.copyWith(color: ColorSystem.white),
                  );
                },
              ),
              const SizedBox(height: 20),
              Text("전하고 싶은 말",
                  style: FontSystem.H4.copyWith(color: ColorSystem.white)),
              Text(
                message.content,
                style: FontSystem.Sub2.copyWith(color: ColorSystem.white),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _showBuyingConfirmation(BuildContext context) {
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
              color: ColorSystem.primary.shade50,
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(Icons.attach_money_outlined,
                  size: 50, color: ColorSystem.primary.shade500),
            ),
          ), // 아이콘 변경 가능
          const SizedBox(height: 10),
          const Text('정말 구매하시겠습니까?', style: FontSystem.H2),
          const SizedBox(height: 10),
          Text('결제 시에 3일 뒤 약국에서 받아가실 수 있습니다!',
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
                    Get.back();
                    Get.back();
                    Get.snackbar("구매완료", "3일 뒤 약국에서 수령 가능하십니다!");
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150, 62),
                      backgroundColor: ColorSystem.primary.shade500),
                  child: Text('구매하기',
                      style: FontSystem.H2.copyWith(color: ColorSystem.white)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    return DateFormat('HH:mm').format(timestamp);
  }
}
