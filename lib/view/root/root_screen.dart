import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/view/base/base_screen.dart';
import 'package:pill_on_phone/view/chatting/chatting_list_screen.dart';
import 'package:pill_on_phone/view/pharmacy/pharmacy_screen.dart';
import 'package:pill_on_phone/view/root/widget/custom_bottom_navigation_bar.dart';
import 'package:pill_on_phone/view/see_more/see_more_screen.dart';
import 'package:pill_on_phone/view_model/root/root_view_model.dart';

class RootScreen extends BaseScreen<RootViewModel> {
  const RootScreen({super.key});

  @override
  bool get wrapWithInnerSafeArea => true;

  @override
  bool get setTopInnerSafeArea => true;

  @override
  bool get setBottomInnerSafeArea => false;

  @override
  bool get extendBodyBehindAppBar => true;

  @override
  Widget buildBody(BuildContext context) {
    return Obx(
      () => IndexedStack(
        index: viewModel.selectedIndex,
        children: const [
          PharmacyScreen(),
          ChattingListScreen(),
          SeeMoreScreen(),
        ],
      ),
    );
  }

  @override
  Widget? buildBottomNavigationBar(BuildContext context) =>
      const CustomBottomNavigationBar();
}
