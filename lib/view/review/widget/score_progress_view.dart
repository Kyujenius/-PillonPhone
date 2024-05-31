import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/config/color_system.dart';
import 'package:pill_on_phone/config/font_system.dart';

class ScoreProgressView extends StatelessWidget {
  const ScoreProgressView({
    super.key,
    required this.title,
    required this.progress,
    required this.count,
  });

  final String title;
  final double progress;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: FontSystem.H5,
        ),
        const SizedBox(width: 8.0),
        SizedBox(
          width: (Get.width - 200) / 2,
          height: 8.0,
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: ColorSystem.neutral.shade100,
            valueColor: const AlwaysStoppedAnimation(
              ColorSystem.primary,
            ),
          ),
        ),
        const Spacer(),
        Text(
          count >= 1000 ? '999+' : count.toString(),
          style: FontSystem.H5,
        ),
      ],
    );
  }
}
