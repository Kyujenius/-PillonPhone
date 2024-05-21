import 'package:flutter/material.dart';
import 'package:pill_on_phone/config/font_system.dart';
import 'package:pill_on_phone/view/base/base_screen.dart';
import 'package:pill_on_phone/view_model/chatting/chatting_view_model.dart';

class ChattingScreen extends BaseScreen<ChattingViewModel> {
  const ChattingScreen({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return const Center(
      child: Text(
        'Chatting Screen',
        style: FontSystem.H3,
      ),
    );
  }
}
