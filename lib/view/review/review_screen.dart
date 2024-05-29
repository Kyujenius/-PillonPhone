import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/config/color_system.dart';
import 'package:pill_on_phone/config/font_system.dart';
import 'package:pill_on_phone/utility/log_util.dart';
import 'package:pill_on_phone/view_model/review/review_view_model.dart';
import 'package:pill_on_phone/widget/app_bar/default_back_appbar.dart';
import 'package:pill_on_phone/widget/button/rounded_rectangle_text_button.dart';

class ReviewScreen extends GetView<ReviewViewModel> {
  const ReviewScreen({super.key});

  ReviewViewModel get viewModel => controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildLowestLayer(),
        _buildConsultationLayer(),
      ],
    );
  }

  Widget _buildLowestLayer() {
    return Scaffold(
      backgroundColor: ColorSystem.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: DefaultBackAppBar(
          title: '약국 후기',
          onBackPress: () {
            Get.back();
          },
        ),
      ),
      body: const Center(
        child: Text('Review Screen'),
      ),
    );
  }

  Widget _buildConsultationLayer() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Column(
        children: [
          Container(
            width: Get.width,
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: RoundedRectangleTextButton(
              text: '후기 쓰기',
              textStyle: FontSystem.H2.copyWith(color: Colors.white),
              onPressed: () {
                LogUtil.info('후기 쓰기');
              },
              backgroundColor: ColorSystem.primary,
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
