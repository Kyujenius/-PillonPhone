import 'package:flutter/material.dart';
import 'package:pill_on_phone/config/color_system.dart';
import 'package:pill_on_phone/view/pharmacy/widget/tag/tag_list_view.dart';
import 'package:pill_on_phone/widget/line/infinity_horizon_line.dart';

class TagDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const TagListView(),
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
  double get maxExtent => 56;

  @override
  double get minExtent => 56;

  @override
  bool shouldRebuild(
    covariant SliverPersistentHeaderDelegate oldDelegate,
  ) {
    return true;
  }
}
