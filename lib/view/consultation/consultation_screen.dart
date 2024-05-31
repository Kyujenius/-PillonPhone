import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/config/color_system.dart';
import 'package:pill_on_phone/config/font_system.dart';
import 'package:pill_on_phone/view/base/base_screen.dart';
import 'package:pill_on_phone/view_model/consultation/consultation_view_model.dart';
import 'package:pill_on_phone/widget/app_bar/default_back_appbar.dart';
import 'package:pill_on_phone/widget/button/rounded_rectangle_text_button.dart';

class ConsultationScreen extends BaseScreen<ConsultationViewModel> {
  const ConsultationScreen({super.key});

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: DefaultBackAppBar(
        title: '상담 신청하기',
        onBackPress: () {
          Get.back();
        },
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          const Text(
            '맞춤 추천을 위해\n'
            '나의 건강 정보를 입력해주세요',
            style: FontSystem.H1,
          ),
          const SizedBox(height: 24),
          Container(
            width: Get.width,
            height: 200,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: ColorSystem.neutral.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              controller: viewModel.contentController,
              decoration: const InputDecoration(
                hintText: '상담 시 하고 싶은 말을 적어주세요. (10자 이상)',
                border: InputBorder.none,
              ),
              onChanged: viewModel.onContentChanged,
              cursorColor: ColorSystem.primary,
              showCursor: true,
              style: FontSystem.Sub2,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: Get.width,
            height: 56,
            child: Obx(
              () => RoundedRectangleTextButton(
                text: '완료',
                textStyle: FontSystem.H2.copyWith(color: Colors.white),
                onPressed: viewModel.isCompleteButtonEnabled
                    ? () {
                        viewModel.onClickCompleteButton().then((result) => {
                              if (result)
                                {
                                  Get.back(),
                                  _showSnackBar(
                                    title: '상담 신청 완료',
                                    content: '약사님이 확인 후 연락드리겠습니다.',
                                  ),
                                }
                              else
                                {
                                  _showSnackBar(
                                    title: '상담 신청 실패',
                                    content: '다시 시도해주세요.',
                                  ),
                                }
                            });
                      }
                    : null,
                backgroundColor: ColorSystem.primary,
                foregroundColor: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 48),
        ],
      ),
    );
  }

  void _showSnackBar({
    required String title,
    required String content,
  }) {
    Get.snackbar(
      title,
      content,
      backgroundColor: ColorSystem.neutral.shade300.withOpacity(0.3),
      colorText: ColorSystem.black,
      duration: const Duration(seconds: 1, milliseconds: 500),
    );
  }
}
