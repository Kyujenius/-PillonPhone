import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/config/color_system.dart';
import 'package:pill_on_phone/config/font_system.dart';
import 'package:pill_on_phone/entity/buy_record/buy_record_brief_state.dart';
import 'package:pill_on_phone/type/e_buy.dart';
import 'package:pill_on_phone/widget/button/rounded_rectangle_text_button.dart';

class BuyRecordItemView extends StatelessWidget {
  const BuyRecordItemView({
    super.key,
    required this.state,
    required this.isFirst,
    required this.isLast,
    this.onTap,
  });

  final BuyRecordBriefState state;
  final bool isFirst;
  final bool isLast;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isFirst) const SizedBox(height: 16) else const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: ColorSystem.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    state.status.koName,
                    style: FontSystem.H4.copyWith(
                      color: state.status.color,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "${state.createdAtStr} 예약",
                    style: FontSystem.Sub2.copyWith(
                      color: ColorSystem.neutral,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      print('cancel');
                    },
                    child: Row(
                      children: [
                        Text(
                          "주문 상세",
                          style: FontSystem.Sub2.copyWith(
                            color: ColorSystem.neutral.shade600,
                            height: 1,
                          ),
                        ),
                        const SizedBox(width: 4),
                        SvgPicture.asset(
                          'assets/icons/chevron_right.svg',
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                state.pharmacyName,
                style: FontSystem.H3.copyWith(
                  height: 1,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${state.totalPriceStr} 원',
                style: FontSystem.H4.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: Get.width,
                height: 56,
                child: RoundedRectangleTextButton(
                  text: '리뷰 쓰기',
                  textStyle: FontSystem.H2.copyWith(color: ColorSystem.white),
                  backgroundColor: ColorSystem.primary,
                  onPressed: state.status == EBuy.visitComplete &&
                          !state.isCompletedReview
                      ? onTap
                      : null,
                ),
              )
            ],
          ),
        ),
        if (isLast) const SizedBox(height: 16) else const SizedBox(height: 8),
      ],
    );
  }
}
