import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/view/base/base_screen.dart';
import 'package:pill_on_phone/view/review/widget/review_information_view.dart';
import 'package:pill_on_phone/view/review/widget/review_list_view.dart';
import 'package:pill_on_phone/view_model/review/review_view_model.dart';
import 'package:pill_on_phone/widget/app_bar/default_back_appbar.dart';

class ReviewScreen extends BaseScreen<ReviewViewModel> {
  const ReviewScreen({super.key});

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: DefaultBackAppBar(
        title: '약국 후기',
        onBackPress: () {
          Get.back();
        },
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return ExtendedNestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          const SliverToBoxAdapter(
            child: ReviewInformationView(),
          ),
        ];
      },
      body: const ReviewListView(),
    );
  }
}
