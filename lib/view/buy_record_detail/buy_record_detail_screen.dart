import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/config/color_system.dart';
import 'package:pill_on_phone/config/font_system.dart';
import 'package:pill_on_phone/view/buy_record_detail/widget/buy_record_detail_article_list_view.dart';
import 'package:pill_on_phone/view/buy_record_detail/widget/buy_record_detail_information_view.dart';
import 'package:pill_on_phone/view_model/buy_record_detail/buy_record_detail_view_model.dart';
import 'package:pill_on_phone/widget/app_bar/default_back_appbar.dart';
import 'package:pill_on_phone/widget/button/rounded_rectangle_text_button.dart';

class BuyRecordDetailScreen extends GetView<BuyRecordDetailViewModel> {
  const BuyRecordDetailScreen({super.key});

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
      backgroundColor: ColorSystem.neutral.shade50,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: DefaultBackAppBar(
          title: '구매 상세 정보',
          backgroundColor: ColorSystem.neutral.shade50,
          onBackPress: () {
            Get.back();
          },
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 16),
              BuyRecordDetailInformationView(),
              SizedBox(height: 16),
              BuyRecordDetailArticleListView(),
              SizedBox(height: 120),
            ],
          ),
        ),
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
              text: '1:1 상담하기',
              textStyle: FontSystem.H2.copyWith(color: Colors.white),
              onPressed: () {
                print('1:1 상담하기');
              },
              backgroundColor: ColorSystem.primary,
            ),
          ),
          const SizedBox(height: 48),
        ],
      ),
    );
  }
}
