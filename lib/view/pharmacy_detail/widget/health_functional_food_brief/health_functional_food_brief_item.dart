import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/config/color_system.dart';
import 'package:pill_on_phone/config/font_system.dart';
import 'package:pill_on_phone/entity/health_functional_food/health_functional_food_brief_state.dart';

class HealthFunctionalFoodBriefItem extends StatelessWidget {
  const HealthFunctionalFoodBriefItem({
    super.key,
    required this.state,
    required this.isFirst,
    required this.isLast,
    this.onTap,
  });

  final HealthFunctionalFoodBriefState state;
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
                imageView(),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width - 144,
                      child: Row(
                        children: [
                          Text(
                            state.name,
                            style: FontSystem.H3.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            decoration: BoxDecoration(
                              color: ColorSystem.neutral.shade50,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Center(
                              child: Text(
                                state.type.koName,
                                style: FontSystem.H5.copyWith(
                                  color: ColorSystem.black,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      state.manufacturer,
                      style: FontSystem.Sub2.copyWith(
                        color: ColorSystem.neutral.shade500,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "${state.price.toString().replaceAllMapped(
                            RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                            (Match m) => '${m[1]},',
                          )}원",
                      style: FontSystem.H1.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    )
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

  Widget imageView() => Container(
        width: 92,
        height: 92,
        decoration: BoxDecoration(
          color: ColorSystem.neutral.shade100,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Center(
          child: Text(
            '사진',
            style: FontSystem.H5,
          ),
        ),
      );
}
