import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pill_on_phone/config/color_system.dart';

class ScoreStarView extends StatelessWidget {
  const ScoreStarView({
    super.key,
    required this.score,
  });

  final int score;

  @override
  Widget build(BuildContext context) {
    int fillStarCount = score;
    int emptyStarCount = 5 - score;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < fillStarCount; i++)
          SvgPicture.asset(
            'assets/icons/star.svg',
            width: 24,
          ),
        for (int i = 0; i < emptyStarCount; i++)
          SvgPicture.asset(
            'assets/icons/star.svg',
            width: 24,
            colorFilter: ColorFilter.mode(
              ColorSystem.neutral.shade200,
              BlendMode.srcIn,
            ),
          ),
      ],
    );
  }
}
