import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/config/color_system.dart';
import 'package:pill_on_phone/config/font_system.dart';
import 'package:pill_on_phone/view/base/base_widget.dart';
import 'package:pill_on_phone/view/review/widget/score_progress_view.dart';
import 'package:pill_on_phone/view/review/widget/score_star_view.dart';
import 'package:pill_on_phone/view_model/review/review_view_model.dart';
import 'package:pill_on_phone/widget/line/infinity_horizon_line.dart';

class ReviewInformationView extends BaseWidget<ReviewViewModel> {
  const ReviewInformationView({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              _buildLeftView(),
              _buildRightView(),
            ],
          ),
          const SizedBox(height: 16.0),
          InfinityHorizonLine(
            height: 1,
            color: ColorSystem.neutral.shade100,
          ),
        ],
      ),
    );
  }

  Widget _buildLeftView() {
    return SizedBox(
      width: (Get.width - 32) / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            viewModel.information.score.toStringAsFixed(2),
            style: FontSystem.H2,
          ),
          const SizedBox(height: 8.0),
          ScoreStarView(
            score: viewModel.information.score.toInt(),
          ),
          const SizedBox(height: 8.0),
          Text(
            "${viewModel.information.totalCount}개",
            style: FontSystem.H5,
          ),
        ],
      ),
    );
  }

  Widget _buildRightView() {
    return SizedBox(
      width: (Get.width - 32) / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ScoreProgressView(
            title: '5점',
            progress: viewModel.information.fiveProgress,
            count: viewModel.information.fiveCount,
          ),
          ScoreProgressView(
            title: '4점',
            progress: viewModel.information.fourProgress,
            count: viewModel.information.fourCount,
          ),
          ScoreProgressView(
            title: '3점',
            progress: viewModel.information.threeProgress,
            count: viewModel.information.threeCount,
          ),
          ScoreProgressView(
            title: '2점',
            progress: viewModel.information.twoProgress,
            count: viewModel.information.twoCount,
          ),
          ScoreProgressView(
            title: '1점',
            progress: viewModel.information.oneProgress,
            count: viewModel.information.oneCount,
          )
        ],
      ),
    );
  }
}
