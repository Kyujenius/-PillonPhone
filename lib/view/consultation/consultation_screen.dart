import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/view/base/base_screen.dart';
import 'package:pill_on_phone/view_model/consultation/consultation_view_model.dart';
import 'package:pill_on_phone/widget/app_bar/default_back_appbar.dart';

class ConsultationScreen extends BaseScreen<ConsultationViewModel> {
  const ConsultationScreen({super.key});

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: DefaultBackAppBar(
        title: '약국 상담 신청하기',
        onBackPress: () {
          Get.back();
        },
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return const Center(
      child: Text('Consultation Screen'),
    );
  }
}
