import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pill_on_phone/config/font_system.dart';

class ChattingAppBar extends StatelessWidget {
  const ChattingAppBar({
    super.key,
    required this.title,
    this.actions = const <Widget>[],
    this.backgroundColor, // shade50 사용
    this.onBackPress,
  });

  final String title;
  final List<Widget> actions;
  final Color? backgroundColor;
  final Function()? onBackPress;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Text(
          title,
          style: FontSystem.H2,
        ),
      ),
      centerTitle: true,
      surfaceTintColor: backgroundColor, // shade500 사용
      backgroundColor: backgroundColor, // shade500 사용
      automaticallyImplyLeading: true,
      titleSpacing: 0,
      leadingWidth: 50,
      leading: IconButton(
        style: TextButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
          backgroundColor: backgroundColor, // shade500 사용
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        icon: SvgPicture.asset(
          "assets/icons/chevron_left.svg",
          width: 24,
          height: 24,
        ),
        onPressed: onBackPress,
      ),
      actions: actions,
    );
  }
}
