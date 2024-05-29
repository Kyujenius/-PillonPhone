import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/view/base/base_widget.dart';
import 'package:pill_on_phone/view/pharmacy_detail/widget/health_functional_food_brief/health_functional_food_brief_item.dart';
import 'package:pill_on_phone/view_model/pharmacy_detail/pharmacy_detail_view_model.dart';

class HealthFunctionalFoodBriefListView
    extends BaseWidget<PharmacyDetailViewModel> {
  const HealthFunctionalFoodBriefListView({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Obx(
      () => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: viewModel.briefs.length,
        itemBuilder: (BuildContext context, int index) {
          return HealthFunctionalFoodBriefItem(
            state: viewModel.briefs[index],
            isFirst: index == 0,
            isLast: index == viewModel.briefs.length - 1,
          );
        },
      ),
    );
  }
}
