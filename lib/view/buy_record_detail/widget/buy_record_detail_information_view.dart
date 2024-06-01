import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/config/color_system.dart';
import 'package:pill_on_phone/config/font_system.dart';
import 'package:pill_on_phone/view/base/base_widget.dart';
import 'package:pill_on_phone/view_model/buy_record_detail/buy_record_detail_view_model.dart';

class BuyRecordDetailInformationView
    extends BaseWidget<BuyRecordDetailViewModel> {
  const BuyRecordDetailInformationView({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Container(
      width: Get.width,
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
              const Text(
                "구매 정보",
                style: FontSystem.H3,
              ),
              const Spacer(),
              Text(
                viewModel.information.status.koName,
                style: FontSystem.H3.copyWith(
                  color: viewModel.information.status.color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "구매 번호",
                    style: FontSystem.Sub3,
                  ),
                  Text(
                    "구매자",
                    style: FontSystem.Sub3,
                  ),
                  Text(
                    "예약 일시",
                    style: FontSystem.Sub3,
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    viewModel.information.orderNumber,
                    style: FontSystem.Sub3.copyWith(
                      color: ColorSystem.neutral.shade400,
                    ),
                  ),
                  Text(
                    viewModel.information.orderName,
                    style: FontSystem.Sub3.copyWith(
                      color: ColorSystem.neutral.shade400,
                    ),
                  ),
                  Text(
                    viewModel.information.createdAtStr,
                    style: FontSystem.Sub3.copyWith(
                      color: ColorSystem.neutral.shade400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
