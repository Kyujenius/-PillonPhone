import 'package:flutter/material.dart';
import 'package:pill_on_phone/config/color_system.dart';

class RoundedRectangleTextButton extends StatelessWidget {
  const RoundedRectangleTextButton({
    super.key,
    required this.text,
    this.textStyle,
    this.backgroundColor,
    this.foregroundColor,
    this.borderSide,
    this.onPressed,
  });

  final String text;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final BorderSide? borderSide;

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        disabledBackgroundColor: ColorSystem.neutral.shade300,
        foregroundColor: foregroundColor,
        side: borderSide,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
