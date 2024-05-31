import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pill_on_phone/config/color_system.dart';
import 'package:pill_on_phone/config/font_system.dart';
import 'package:pill_on_phone/entity/pharmacy/pharmacy_information_state.dart';
import 'package:pill_on_phone/widget/box/image_box.dart';

class PharmacyBriefItem extends StatelessWidget {
  const PharmacyBriefItem({
    super.key,
    required this.state,
    required this.isFirst,
    required this.isLast,
    this.onTap,
  });

  final PharmacyBriefState state;
  final bool isFirst;
  final bool isLast;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          if (isFirst)
            const SizedBox(height: 16)
          else
            const SizedBox(height: 8),
          SizedBox(
            height: 92,
            child: Row(
              children: [
                const SizedBox(width: 16),
                ImageBox(
                  width: 92,
                  height: 92,
                  imageUrl: state.imageUrl,
                  borderRadius: BorderRadius.circular(16),
                  backgroundColor: ColorSystem.neutral.shade100,
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.name,
                      style: FontSystem.H2,
                    ),
                    Text(
                      state.address,
                      style: FontSystem.Sub2,
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/star.svg',
                            height: 20,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "${state.reviewScore.toStringAsFixed(1)} (${state.reviewCount > 99 ? '99+' : state.reviewCount})",
                            style: FontSystem.Sub2,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (isLast) const SizedBox(height: 16) else const SizedBox(height: 8),
        ],
      ),
    );
  }
}
