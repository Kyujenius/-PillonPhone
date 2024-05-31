import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/config/color_system.dart';
import 'package:pill_on_phone/config/font_system.dart';
import 'package:pill_on_phone/view/base/base_screen.dart';
import 'package:pill_on_phone/view/buy_record/widget/buy_record_list_view.dart';
import 'package:pill_on_phone/view_model/buy_record_screen/buy_record_view_model.dart';
import 'package:pill_on_phone/widget/app_bar/default_back_appbar.dart';
import 'package:pill_on_phone/widget/line/infinity_horizon_line.dart';

class BuyRecordScreen extends BaseScreen<BuyRecordViewModel> {
  const BuyRecordScreen({super.key});

  @override
  Color? get screenBackgroundColor => ColorSystem.neutral.shade50;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(57),
      child: Column(
        children: [
          DefaultBackAppBar(
            title: '나의 구매 목록',
            backgroundColor: ColorSystem.neutral.shade50,
            onBackPress: () {
              Get.back();
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: InfinityHorizonLine(
              height: 1,
              color: ColorSystem.neutral.shade300,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ExtendedNestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    '약알에서 구매한 영양제 목록이예요.\n(결제 후 5일이 지나면 자동 구매 확정)',
                    style: FontSystem.H5.copyWith(
                      color: ColorSystem.neutral,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ];
        },
        body: const BuyRecordListView(),
      ),
    );
  }
}
