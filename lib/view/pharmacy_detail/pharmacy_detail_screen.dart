import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/config/app_routes.dart';
import 'package:pill_on_phone/config/color_system.dart';
import 'package:pill_on_phone/config/font_system.dart';
import 'package:pill_on_phone/view/pharmacy_detail/delegate/health_functional_food_tag_delegate.dart';
import 'package:pill_on_phone/view/pharmacy_detail/widget/default/pharmacy_information_view.dart';
import 'package:pill_on_phone/view/pharmacy_detail/widget/health_functional_food_brief/health_functional_food_brief_list_view.dart';
import 'package:pill_on_phone/view_model/pharmacy_detail/pharmacy_detail_view_model.dart';
import 'package:pill_on_phone/widget/app_bar/default_back_appbar.dart';
import 'package:pill_on_phone/widget/button/rounded_rectangle_text_button.dart';

class PharmacyDetailScreen extends GetView<PharmacyDetailViewModel> {
  const PharmacyDetailScreen({super.key});

  PharmacyDetailViewModel get viewModel => controller;

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
          title: '약국 상세',
          onBackPress: () {
            Get.back();
          },
        ),
      ),
      body: ExtendedNestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            // Pharmacy Information
            const SliverToBoxAdapter(
              child: PharmacyInformationView(),
            ),

            // 판매 약 목록
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Text(
                  "판매 약 목록",
                  style: FontSystem.H2,
                ),
              ),
            ),

            // Tag Delegate
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: HealthFunctionalFoodTagDelegate(),
            ),
          ];
        },
        body: const HealthFunctionalFoodBriefListView(),
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
              text: '약국과 상담하기',
              textStyle: FontSystem.H2.copyWith(color: Colors.white),
              onPressed: () {
                Get.toNamed(AppRoutes.CONSULTATION);
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
