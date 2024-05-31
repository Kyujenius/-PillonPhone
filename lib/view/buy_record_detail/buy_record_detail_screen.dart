import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/config/color_system.dart';
import 'package:pill_on_phone/view/base/base_screen.dart';
import 'package:pill_on_phone/view_model/buy_record_detail/buy_record_detail_view_model.dart';
import 'package:pill_on_phone/widget/app_bar/default_back_appbar.dart';

class BuyRecordDetailScreen extends BaseScreen<BuyRecordDetailViewModel> {
  const BuyRecordDetailScreen({super.key});

  @override
  Color? get screenBackgroundColor => ColorSystem.neutral.shade50;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: DefaultBackAppBar(
        title: '구매 상세 정보',
        backgroundColor: ColorSystem.neutral.shade50,
        onBackPress: () {
          Get.back();
        },
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return const Center(
      child: Text('BuyRecordDetailScreen'),
    );
  }
}
