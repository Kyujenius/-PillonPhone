import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/config/color_system.dart';
import 'package:pill_on_phone/config/font_system.dart';
import 'package:pill_on_phone/view/base/base_widget.dart';
import 'package:pill_on_phone/view_model/see_more/see_more_view_model.dart';
import 'package:pill_on_phone/widget/button/rounded_rectangle_text_button.dart';

class UserInformationView extends BaseWidget<SeeMoreViewModel> {
  const UserInformationView({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: const BoxDecoration(
        color: ColorSystem.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${viewModel.nickname}님,',
            style: FontSystem.H1,
          ),
          Text(
            '약알과 함께 건강하세요!',
            style: FontSystem.H2.copyWith(
              color: ColorSystem.neutral,
            ),
          ),
          const SizedBox(height: 36),
          SizedBox(
            width: Get.width,
            height: 56,
            child: RoundedRectangleTextButton(
              text: '로그아웃',
              textStyle: FontSystem.H2.copyWith(color: ColorSystem.white),
              onPressed: () {},
              backgroundColor: ColorSystem.primary,
            ),
          ),
        ],
      ),
    );
  }
}
