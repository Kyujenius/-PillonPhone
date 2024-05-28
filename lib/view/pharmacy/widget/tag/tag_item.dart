import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/config/color_system.dart';
import 'package:pill_on_phone/config/font_system.dart';
import 'package:pill_on_phone/entity/tag/tag_state.dart';

class TagItem extends StatelessWidget {
  const TagItem({
    super.key,
    required this.state,
    required this.isFirst,
    required this.isLast,
    required this.onTap,
  });

  final TagState state;
  final bool isFirst;
  final bool isLast;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (isFirst) const SizedBox(width: 16) else const SizedBox(width: 4),
        Container(
          width: (Get.width - 56) / 4,
          decoration: BoxDecoration(
            color: state.isSelected
                ? ColorSystem.primary
                : ColorSystem.neutral.shade50,
            borderRadius: BorderRadius.circular(24),
          ),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(24),
            child: Center(
              child: Text(
                state.criteria.koName,
                style: FontSystem.H5.copyWith(
                  color:
                      state.isSelected ? ColorSystem.white : ColorSystem.black,
                ),
              ),
            ),
          ),
        ),
        if (isLast) const SizedBox(width: 16) else const SizedBox(width: 4),
      ],
    );
  }
}
