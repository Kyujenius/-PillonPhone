import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/config/color_system.dart';
import 'package:pill_on_phone/view/base/base_widget.dart';
import 'package:pill_on_phone/view/pharmacy/widget/pharmacy_criteria_tag/pharmacy_criteria_tag_item.dart';
import 'package:pill_on_phone/view_model/pharmacy/pharmacy_view_model.dart';

class PharmacyCriteriaTagListView extends BaseWidget<PharmacyViewModel> {
  const PharmacyCriteriaTagListView({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Container(
      height: 36,
      color: ColorSystem.white,
      child: Obx(
        () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: viewModel.tags.length,
          itemBuilder: (BuildContext context, int index) {
            return PharmacyCriteriaTagItem(
              state: viewModel.tags[index],
              isFirst: index == 0,
              isLast: index == viewModel.tags.length - 1,
              onTap: () {
                viewModel
                    .fetchSelectedTag(viewModel.tags[index].type)
                    .then((result) => {
                          if (!result)
                            {
                              Get.snackbar(
                                '알림',
                                '하나는 선택되어 있어야 합니다.',
                                backgroundColor: ColorSystem.neutral.shade300
                                    .withOpacity(0.3),
                                colorText: ColorSystem.black,
                                duration: const Duration(seconds: 1),
                              )
                            }
                        });
              },
            );
          },
        ),
      ),
    );
  }
}
