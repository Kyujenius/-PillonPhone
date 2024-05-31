import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/config/color_system.dart';
import 'package:pill_on_phone/config/font_system.dart';
import 'package:pill_on_phone/view/base/base_widget.dart';
import 'package:pill_on_phone/view/buy_record_detail/widget/buy_record_detail_article_item_view.dart';
import 'package:pill_on_phone/view_model/buy_record_detail/buy_record_detail_view_model.dart';
import 'package:pill_on_phone/widget/line/infinity_horizon_line.dart';

class BuyRecordDetailArticleListView
    extends BaseWidget<BuyRecordDetailViewModel> {
  const BuyRecordDetailArticleListView({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorSystem.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "구매 물품",
            style: FontSystem.H3,
          ),
          const SizedBox(height: 16),
          Obx(
            () => ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: viewModel.articles.length,
              itemBuilder: (context, index) {
                return BuyRecordDetailArticleItemView(
                  state: viewModel.articles[index],
                  isFirst: index == 0,
                  isLast: index == viewModel.articles.length - 1,
                );
              },
              separatorBuilder: (context, index) {
                return InfinityHorizonLine(
                  height: 1,
                  color: ColorSystem.neutral.shade100,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
