import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pill_on_phone/config/color_system.dart';
import 'package:pill_on_phone/config/font_system.dart';
import 'package:pill_on_phone/entity/review/review_state.dart';
import 'package:pill_on_phone/view/review/widget/score_star_view.dart';
import 'package:pill_on_phone/widget/line/infinity_horizon_line.dart';

class ReviewItemView extends StatelessWidget {
  const ReviewItemView({
    super.key,
    required this.state,
    required this.isFirst,
    required this.isLast,
    this.onTap,
  });

  final ReviewState state;
  final bool isFirst;
  final bool isLast;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: isFirst ? 16 : 8,
        bottom: isLast ? 16 : 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                state.createdBy,
                style: FontSystem.H2.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  "신고하기",
                  style: FontSystem.Sub2.copyWith(
                    color: ColorSystem.neutral,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              ScoreStarView(score: state.score),
              const Spacer(),
              Text(
                state.createdAt,
                style: FontSystem.Sub2.copyWith(
                  color: ColorSystem.neutral,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            state.content,
            style: FontSystem.H5,
          ),
          const SizedBox(height: 16),
          InfinityHorizonLine(
            height: 1,
            color: ColorSystem.neutral.shade100,
          ),
        ],
      ),
    );
  }
}
