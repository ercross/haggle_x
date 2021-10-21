import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hagglex/main.dart';
import 'package:hagglex/stylesheet.dart';
import 'package:hagglex/view/widgets/buttons.dart';
import 'package:hagglex/view/widgets/fade_in_widget.dart';

class EmailVerificationSuccessPage extends StatelessWidget {
  const EmailVerificationSuccessPage();

  static const String route = "/email-verification-success";

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        systemNavigationBarContrastEnforced: true,
        statusBarIconBrightness: Brightness.light));
    final Size size = MediaQuery.of(context).size;
    final double pageHeight = size.height;
    final double pageWidth = size.width;
    return BlankPage.withoutSafeArea(
      child: Container(
        height: pageHeight,
        width: pageWidth,
        padding: EdgeInsets.only(
            top: pageHeight * 0.27,
            left: pageWidth * 0.07,
            right: pageWidth * 0.07,
            bottom: pageHeight * 0.18),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          HaggleXColour.primary,
          Color(0xFF3F1BB6),
          HaggleXColour.primary
        ], stops: [
          0.05123,
          0.2234,
          0.9
        ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FadeInWidget(
              _TopContent(height: pageHeight * 0.15, width: pageWidth * 0.7),
              duration: 1500,
            ),
            HorizontalButton(
                color: HaggleXColour.accentLight,
                height: pageHeight * 0.06,
                width: pageWidth,
                text: "START EXPLORING",
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}

class _TopContent extends StatelessWidget {
  final double width;
  final double height;
  const _TopContent({required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomCheckMark(
              gradient: LinearGradient(
                  colors: [HaggleXColour.accentLight, Colors.white],
                  begin: Alignment.topCenter,
                  stops: [0.1, 0.97],
                  end: Alignment.bottomCenter),
              radius: height * 0.4),
          Text("Setup Complete",
              textAlign: TextAlign.center, style: Fonts.white16w500),
          Text("Thank you for setting up your HaggleX account",
              textAlign: TextAlign.center, style: Fonts.white12w300),
        ],
      ),
    );
  }
}

class CustomCheckMark extends StatelessWidget {
  final double radius;
  final Color? color;
  final Gradient? gradient;
  const CustomCheckMark({required this.radius, this.color, this.gradient});

  @override
  Widget build(BuildContext context) {
    assert(color != null || gradient != null);
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        gradient: gradient,
      ),
      alignment: Alignment.center,
      child: FaIcon(FontAwesomeIcons.check,
          color: HaggleXColour.primary, size: radius * 0.6),
    );
  }
}
