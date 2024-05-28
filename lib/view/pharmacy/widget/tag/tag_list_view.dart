import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/config/color_system.dart';
import 'package:pill_on_phone/view/base/base_widget.dart';
import 'package:pill_on_phone/view/pharmacy/widget/tag/tag_item.dart';
import 'package:pill_on_phone/view_model/pharmacy/pharmacy_view_model.dart';

class TagListView extends BaseWidget<PharmacyViewModel> {
  const TagListView({super.key});

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
            return TagItem(
              state: viewModel.tags[index],
              isFirst: index == 0,
              isLast: index == viewModel.tags.length - 1,
              onTap: () {
                viewModel.fetchSelectedTag(viewModel.tags[index].criteria);
              },
            );
          },
        ),
      ),
    );
  }
}
