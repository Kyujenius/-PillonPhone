import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/utility/log_util.dart';
import 'package:pill_on_phone/view/base/base_widget.dart';
import 'package:pill_on_phone/view/review/widget/review_item_view.dart';
import 'package:pill_on_phone/view_model/review/review_view_model.dart';

class ReviewListView extends BaseWidget<ReviewViewModel> {
  const ReviewListView({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Obx(
      () => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: viewModel.reviews.length,
        itemBuilder: (BuildContext context, int index) {
          return ReviewItemView(
            state: viewModel.reviews[index],
            isFirst: index == 0,
            isLast: index == viewModel.reviews.length - 1,
            onTap: () {
              LogUtil.info('Review Item Tapped $index');
            },
          );
        },
      ),
    );
  }
}
