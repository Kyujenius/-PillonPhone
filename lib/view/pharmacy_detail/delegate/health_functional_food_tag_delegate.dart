import 'package:flutter/material.dart';
import 'package:pill_on_phone/config/color_system.dart';
import 'package:pill_on_phone/view/pharmacy_detail/widget/health_functional_food_tag/health_functional_food_tag_list_view.dart';
import 'package:pill_on_phone/widget/line/infinity_horizon_line.dart';

class HealthFunctionalFoodTagDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 16,
          color: ColorSystem.white,
        ),
        const HealthFunctionalFoodTagListView(),
        Container(
          height: 16,
          color: ColorSystem.white,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InfinityHorizonLine(
            height: 1,
            color: ColorSystem.neutral.shade50,
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 72;

  @override
  double get minExtent => 72;

  @override
  bool shouldRebuild(
    covariant SliverPersistentHeaderDelegate oldDelegate,
  ) {
    return true;
  }
}
