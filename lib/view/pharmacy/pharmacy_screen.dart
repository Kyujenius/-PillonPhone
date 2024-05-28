import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:pill_on_phone/config/color_system.dart';
import 'package:pill_on_phone/config/font_system.dart';
import 'package:pill_on_phone/utility/log_util.dart';
import 'package:pill_on_phone/view/base/base_screen.dart';
import 'package:pill_on_phone/view/pharmacy/delegate/tag_delegate.dart';
import 'package:pill_on_phone/view/pharmacy/widget/pharmacy_brief/pharmacy_brief_list_view.dart';
import 'package:pill_on_phone/view_model/pharmacy/pharmacy_view_model.dart';
import 'package:pill_on_phone/widget/button/rounded_rectangle_text_button.dart';

class PharmacyScreen extends BaseScreen<PharmacyViewModel> {
  const PharmacyScreen({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return ExtendedNestedScrollView(
      headerSliverBuilder: _sliverBuilder,
      body: const PharmacyBriefListView(),
    );
  }

  List<Widget> _sliverBuilder(BuildContext context, bool innerBoxIsScrolled) {
    return [
      // User Brief View
      SliverToBoxAdapter(
        child: Container(
          height: 80,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: const BoxDecoration(
            color: ColorSystem.primary,
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: RoundedRectangleTextButton(
            text: '영양제 검색',
            textStyle: FontSystem.H2.copyWith(color: Colors.white),
            onPressed: () {
              LogUtil.info('영양제 검색 버튼 클릭');
            },
          ),
        ),
      ),

      // Weekly Calendar
      SliverPersistentHeader(
        pinned: true,
        floating: true,
        delegate: TagDelegate(),
      ),
    ];
  }
}
