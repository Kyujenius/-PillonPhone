import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/config/app_routes.dart';
import 'package:pill_on_phone/config/color_system.dart';
import 'package:pill_on_phone/view/base/base_screen.dart';
import 'package:pill_on_phone/view/see_more/widget/rounded_rectangle_tile_view.dart';
import 'package:pill_on_phone/view/see_more/widget/user_information_view.dart';
import 'package:pill_on_phone/view_model/see_more/see_more_view_model.dart';
import 'package:pill_on_phone/widget/app_bar/default_app_bar.dart';

class SeeMoreScreen extends BaseScreen<SeeMoreViewModel> {
  const SeeMoreScreen({super.key});

  @override
  Color? get screenBackgroundColor => ColorSystem.neutral.shade50;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const PreferredSize(
      preferredSize: Size.fromHeight(42),
      child: DefaultAppBar(
        title: '더보기',
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        const UserInformationView(),
        const SizedBox(height: 20),
        ..._buildButtonView(),
      ],
    );
  }

  List<Widget> _buildButtonView() {
    return [
      RoundedRectangleTileView(
        title: '앱 설정',
        svgPath: 'assets/icons/setting.svg',
        svgColor: ColorSystem.primary.shade600,
        onPressed: () {
          print('Pressed');
        },
      ),
      const SizedBox(height: 20),
      RoundedRectangleTileView(
        title: '구매 목록',
        svgPath: 'assets/icons/buy_record.svg',
        svgColor: ColorSystem.primary.shade500,
        onPressed: () {
          Get.toNamed(AppRoutes.BUY_RECORD);
        },
      ),
    ];
  }
}
