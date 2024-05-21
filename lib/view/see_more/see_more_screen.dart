import 'package:flutter/material.dart';
import 'package:pill_on_phone/config/font_system.dart';
import 'package:pill_on_phone/view/base/base_screen.dart';
import 'package:pill_on_phone/view_model/see_more/see_more_view_model.dart';

class SeeMoreScreen extends BaseScreen<SeeMoreViewModel> {
  const SeeMoreScreen({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return const Center(
      child: Text(
        'See More Screen',
        style: FontSystem.H3,
      ),
    );
  }
}
