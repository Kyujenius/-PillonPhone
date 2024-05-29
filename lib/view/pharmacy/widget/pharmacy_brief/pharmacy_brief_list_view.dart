import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/config/app_routes.dart';
import 'package:pill_on_phone/view/base/base_widget.dart';
import 'package:pill_on_phone/view/pharmacy/widget/pharmacy_brief/pharmacy_brief_item.dart';
import 'package:pill_on_phone/view_model/pharmacy/pharmacy_view_model.dart';

class PharmacyBriefListView extends BaseWidget<PharmacyViewModel> {
  const PharmacyBriefListView({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: viewModel.pharmacyBriefs.length,
        itemBuilder: (BuildContext context, int index) {
          return PharmacyBriefItem(
            state: viewModel.pharmacyBriefs[index],
            isFirst: index == 0,
            isLast: index == viewModel.pharmacyBriefs.length - 1,
            onTap: () {
              Get.toNamed(
                AppRoutes.PHARMACY_DETAIL,
                arguments: {
                  "id": viewModel.pharmacyBriefs[index].id,
                },
              );
            },
          );
        },
      ),
    );
  }
}
