import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/config/color_system.dart';
import 'package:shimmer/shimmer.dart';

class HealthFunctionalFoodBriefSkeletonItem extends StatelessWidget {
  const HealthFunctionalFoodBriefSkeletonItem({
    super.key,
    required this.isFirst,
    required this.isLast,
  });

  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isFirst) const SizedBox(height: 16) else const SizedBox(height: 8),
        SizedBox(
          height: 92,
          child: Row(
            children: [
              const SizedBox(width: 16),
              _buildSkeletonLoader(
                width: 92,
                height: 92,
                borderRadius: BorderRadius.circular(16),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Get.width - 144,
                    child: Row(
                      children: [
                        _buildSkeletonLoader(
                          width: 180,
                          height: 24,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        const Spacer(),
                        _buildSkeletonLoader(
                          width: 80,
                          height: 24,
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildSkeletonLoader(
                    width: 80,
                    height: 16,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  const Spacer(),
                  _buildSkeletonLoader(
                    width: 120,
                    height: 24,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ],
              ),
            ],
          ),
        ),
        if (isLast) const SizedBox(height: 76) else const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildSkeletonLoader({
    required double width,
    required double height,
    required BorderRadius borderRadius,
  }) {
    return Shimmer.fromColors(
      baseColor: ColorSystem.neutral.shade100,
      highlightColor: ColorSystem.white,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: ColorSystem.neutral.shade100,
        ),
      ),
    );
  }
}
