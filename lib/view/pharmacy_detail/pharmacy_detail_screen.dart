import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/view/base/base_screen.dart';
import 'package:pill_on_phone/view_model/pharmacy_detail/pharmacy_detail_view_model.dart';
import 'package:pill_on_phone/widget/app_bar/default_back_appbar.dart';

class PharmacyDetailScreen extends BaseScreen<PharmacyDetailViewModel> {
  const PharmacyDetailScreen({super.key});

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: DefaultBackAppBar(
        title: '약국 상세',
        onBackPress: () {
          Get.back();
        },
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return const Center(
      child: Text(
        'Pharmacy Detail Screen',
      ),
    );
  }
}
