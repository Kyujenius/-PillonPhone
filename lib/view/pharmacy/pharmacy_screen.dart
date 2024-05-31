import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/config/app_routes.dart';
import 'package:pill_on_phone/config/color_system.dart';
import 'package:pill_on_phone/config/font_system.dart';
import 'package:pill_on_phone/view/base/base_screen.dart';
import 'package:pill_on_phone/view/pharmacy/delegate/pharmacy_criteria_tag_delegate.dart';
import 'package:pill_on_phone/view/pharmacy/widget/pharmacy_brief/pharmacy_brief_list_view.dart';
import 'package:pill_on_phone/view_model/pharmacy/pharmacy_view_model.dart';
import 'package:pill_on_phone/widget/app_bar/default_app_bar.dart';
import 'package:pill_on_phone/widget/button/rounded_rectangle_text_button.dart';

class PharmacyScreen extends BaseScreen<PharmacyViewModel> {
  const PharmacyScreen({super.key});

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const PreferredSize(
      preferredSize: Size.fromHeight(42),
      child: DefaultAppBar(
        title: '약국',
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return ExtendedNestedScrollView(
      headerSliverBuilder: _sliverBuilder,
      body: const PharmacyBriefListView(),
    );
  }

  List<Widget> _sliverBuilder(BuildContext context, bool innerBoxIsScrolled) {
    return [
      // Gap
      SliverToBoxAdapter(
        child: _buildHorizontalGap(),
      ),

      // User Brief View
      SliverToBoxAdapter(
        child: _buildSearchButton(),
      ),

      // Tag Delegate
      SliverPersistentHeader(
        pinned: true,
        floating: true,
        delegate: PharmacyCriteriaTagDelegate(),
      ),
    ];
  }

  Widget _buildHorizontalGap() {
    return const SizedBox(
      height: 16,
    );
  }

  Widget _buildSearchButton() {
    return Container(
      width: Get.width - 32,
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: RoundedRectangleTextButton(
        text: '영양제 검색하기',
        textStyle: FontSystem.H2.copyWith(color: Colors.white),
        onPressed: () {
          Get.toNamed(AppRoutes.SEARCH_HEALTH_FUNCTION_FOOD);
        },
        backgroundColor: ColorSystem.primary,
      ),
    );
  }
}
