import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/config/color_system.dart';
import 'package:pill_on_phone/config/font_system.dart';
import 'package:pill_on_phone/utility/log_util.dart';
import 'package:pill_on_phone/view/base/base_widget.dart';
import 'package:pill_on_phone/view_model/pharmacy_detail/pharmacy_detail_view_model.dart';

class PharmacyInformationView extends BaseWidget<PharmacyDetailViewModel> {
  const PharmacyInformationView({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Column(
      children: [
        _buildImageView(),
        const SizedBox(height: 40),
        _buildBriefView(),
        const SizedBox(height: 16),
        _buildDescriptionView(),
        const SizedBox(height: 16),
        _buildPharmacistView(),
      ],
    );
  }

  Widget _buildImageView() {
    return Container(
      width: Get.width,
      height: 220,
      color: ColorSystem.neutral.shade100,
      child: Obx(
        () => CachedNetworkImage(
          imageUrl: viewModel.information.imageUrl,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }

  Widget _buildBriefView() {
    return SizedBox(
      height: 72,
      child: Row(
        children: [
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Text(
                  viewModel.information.name,
                  style: FontSystem.H1,
                ),
              ),
              const Spacer(),
              Obx(
                () => Text(
                  viewModel.information.address,
                  style: FontSystem.Sub2.copyWith(
                    color: ColorSystem.neutral.shade600,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/star.svg',
                    height: 32,
                  ),
                  const SizedBox(width: 4),
                  Obx(
                    () => Text(
                      viewModel.information.reviewScore.toStringAsFixed(1),
                      style: FontSystem.H1,
                    ),
                  )
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  LogUtil.info("Review Clicked");
                },
                child: Row(
                  children: [
                    Obx(
                      () => Text(
                        "${viewModel.information.reviewCount > 99 ? '99+' : viewModel.information.reviewCount}개의 리뷰",
                        style: FontSystem.Sub2.copyWith(
                          color: ColorSystem.neutral.shade600,
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/icons/chevron_right.svg',
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }

  Widget _buildDescriptionView() {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: ColorSystem.neutral.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Obx(
        () => Text(
          viewModel.information.description,
          style: FontSystem.Sub2.copyWith(
            color: ColorSystem.neutral.shade600,
          ),
        ),
      ),
    );
  }

  Widget _buildPharmacistView() {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: ColorSystem.neutral.shade200,
        ),
      ),
      child: Row(
        children: [
          ClipOval(
            child: Container(
              width: 48,
              height: 48,
              color: ColorSystem.neutral.shade100,
              child: Obx(
                () => CachedNetworkImage(
                  imageUrl: viewModel.information.imageUrl,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Obx(
            () => Text(
              "${viewModel.information.pharmacistName} 약사님",
              style: FontSystem.H2,
            ),
          ),
        ],
      ),
    );
  }
}
