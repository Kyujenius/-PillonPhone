import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/view/base/base_screen.dart';
import 'package:pill_on_phone/view_model/search_health_functional_food/search_health_functional_food_view_model.dart';
import 'package:pill_on_phone/widget/app_bar/default_back_appbar.dart';

class SearchHealthFunctionalFoodScreen
    extends BaseScreen<SearchHealthFunctionalFoodViewModel> {
  const SearchHealthFunctionalFoodScreen({super.key});

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: DefaultBackAppBar(
        title: '영양제 검색하기',
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
        'SearchHealthFunctionalFood\nScreen',
        textAlign: TextAlign.center,
      ),
    );
  }
}
