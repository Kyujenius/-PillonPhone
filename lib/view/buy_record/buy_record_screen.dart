import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/config/color_system.dart';
import 'package:pill_on_phone/view/base/base_screen.dart';
import 'package:pill_on_phone/view_model/buy_record_screen/buy_record_view_model.dart';
import 'package:pill_on_phone/widget/app_bar/default_back_appbar.dart';

class BuyRecordScreen extends BaseScreen<BuyRecordViewModel> {
  const BuyRecordScreen({super.key});

  @override
  Color? get screenBackgroundColor => ColorSystem.neutral.shade50;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: DefaultBackAppBar(
        title: '',
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
      child: Text(
        'Buy Record Screen',
      ),
    );
  }
}
