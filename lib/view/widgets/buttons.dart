import 'package:flutter/material.dart';

import '../../stylesheet.dart';

class HorizontalButton extends StatelessWidget {
  final double height;
  final double width;
  final Gradient? gradient;
  final Color? color;
  final String text;
  final TextStyle? textFont;
  final Function() onPressed;
  const HorizontalButton(
      {required this.height,
      required this.width,
      this.gradient,
      this.color,
      this.textFont,
      required this.text,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    assert(gradient != null || color != null);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: gradient,
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(text,
            textAlign: TextAlign.center,
            style: textFont == null ? Fonts.black12w600 : textFont),
      ),
    );
  }
}
