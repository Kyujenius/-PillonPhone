import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/utility/log_util.dart';
import 'package:pill_on_phone/view/base/base_widget.dart';
import 'package:pill_on_phone/view/buy_record/widget/buy_record_item_view.dart';
import 'package:pill_on_phone/view_model/buy_record_screen/buy_record_view_model.dart';

class BuyRecordListView extends BaseWidget<BuyRecordViewModel> {
  const BuyRecordListView({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: viewModel.briefs.length,
        itemBuilder: (BuildContext context, int index) {
          return BuyRecordItemView(
            state: viewModel.briefs[index],
            isFirst: index == 0,
            isLast: index == viewModel.briefs.length - 1,
            onTap: () {
              LogUtil.info('onTap $index');
            },
          );
        },
      ),
    );
  }
}
