import 'package:flutter/material.dart';
import 'package:pill_on_phone/config/font_system.dart';
import 'package:pill_on_phone/view/base/base_screen.dart';
import 'package:pill_on_phone/view_model/pharmacy/pharmacy_view_model.dart';

class PharmacyScreen extends BaseScreen<PharmacyViewModel> {
  const PharmacyScreen({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return const Center(
      child: Text(
        'Pharmacy Screen',
        style: FontSystem.H3,
      ),
    );
  }
}
