import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hagglex/view/pages/authentication/sign_in.dart';

import '../../../main.dart';
import '../../../stylesheet.dart';
import '../../widgets/buttons.dart';
import '../../widgets/fade_in_widget.dart';
import '../../widgets/text_fields.dart';

class EmailVerificationPage extends StatelessWidget {
  const EmailVerificationPage();

  static const String route = "/verify-email";

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
        backgroundColor: HaggleXColour.primary,
        child: Center(
            child: Column(children: [
          Container(
            height: pageHeight * 0.23,
            width: pageWidth,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(
                top: pageHeight * 0.08,
                left: pageWidth * 0.1,
                bottom: pageHeight * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _BackButton(
                  height: pageHeight * 0.045,
                  width: pageWidth * 0.12,
                ),
                Text("Verify your account", style: Fonts.white18w500)
              ],
            ),
          ),
          Container(
            height: pageHeight * 0.61,
            width: pageWidth * 0.9,
            padding: EdgeInsets.symmetric(
                horizontal: pageWidth * 0.1, vertical: pageHeight * 0.05),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: _Content(),
          )
        ])));
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      final double width = constraints.maxWidth;
      final double height = constraints.maxHeight;
      final double textFieldHeight = height * 0.12;

      return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FadeInWidget(
                FaIcon(FontAwesomeIcons.solidCheckCircle,
                    color: HaggleXColour.primary, size: width * 0.15),
                duration: 2000),
            Text(
                "We just sent a verification code to your email. Please enter the code",
                textAlign: TextAlign.center,
                style: Fonts.black12w500),
            ShapelessTextField(
                label: "Verification code",
                brightness: Brightness.dark,
                onSaved: (_) {},
                inputType: TextInputType.text,
                height: textFieldHeight,
                width: width),
            HorizontalButton(
                height: height * 0.1,
                width: width * 0.9,
                textFont: Fonts.white12w500,
                gradient: LinearGradient(
                  colors: [HaggleXColour.primary, HaggleXColour.primaryLight],
                ),
                text: "VERIFY ME",
                onPressed: () => Get.offAndToNamed(SignInPage.route)),
            Text("The code will expire in 10 minutes",
                textAlign: TextAlign.center, style: Fonts.black12w300),
            Text("Resend Code",
                textAlign: TextAlign.center,
                style: Fonts.black13w300.copyWith(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w600))
          ]);
    });
  }
}

class _BackButton extends StatelessWidget {
  final double height;
  final double width;
  const _BackButton({required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Get.back,
      child: Container(
          alignment: Alignment.center,
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white24,
          ),
          child: Icon(
            Icons.arrow_back_ios_rounded,
            size: 20,
            color: Colors.white,
          )),
    );
  }
}
