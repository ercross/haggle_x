import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hagglex/main.dart';
import 'package:hagglex/stylesheet.dart';
import 'package:hagglex/view/widgets/buttons.dart';
import 'package:hagglex/view/widgets/text_fields.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage();

  static const String route = "/sign-up";

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: pageHeight * 0.07,
                    left: pageWidth * 0.07,
                    bottom: pageHeight * 0.04),
                child: _BackButton(
                  height: pageHeight * 0.045,
                  width: pageWidth * 0.12,
                ),
              ),
              Container(
                height: pageHeight * 0.7,
                width: pageWidth * 0.9,
                padding: EdgeInsets.symmetric(
                    horizontal: pageWidth * 0.05, vertical: pageHeight * 0.05),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: _Content(),
              )
            ],
          ),
        ));
  }
}

class _BackButton extends StatelessWidget {
  final double height;
  final double width;
  const _BackButton({required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        ));
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      final double width = constraints.maxWidth;
      final double height = constraints.maxHeight;
      final double textFieldHeight = height * 0.1;
      final Widget space = SizedBox(height: height * 0.02);
      return Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Create a new account",
                  style: Fonts.black14w400
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 15))),
          SizedBox(height: height * 0.08),
          ShapelessTextField(
              label: "Email Address",
              brightness: Brightness.dark,
              onSaved: (_) {},
              inputType: TextInputType.emailAddress,
              height: textFieldHeight,
              width: width),
          space,
          ShapelessTextField.forPassword(
              brightness: Brightness.dark,
              onSaved: (_) {},
              height: textFieldHeight,
              width: width),
          space,
          ShapelessTextField(
              label: "Create a username",
              brightness: Brightness.dark,
              onSaved: (_) {},
              inputType: TextInputType.emailAddress,
              height: textFieldHeight,
              width: width),
          space,
          _PhoneNumber(textFieldHeight: textFieldHeight, width: width),
          space,
          ShapelessTextField(
              label: "Referral code (optional)",
              brightness: Brightness.dark,
              onSaved: (_) {},
              inputType: TextInputType.emailAddress,
              height: textFieldHeight,
              width: width),
          SizedBox(height: height * 0.04),
          Text("By signing up, you agree to HaggleX terms and privacy policy",
              textAlign: TextAlign.center, style: Fonts.black12w300),
          SizedBox(height: height * 0.07),
          HorizontalButton(
              height: textFieldHeight,
              width: width * 0.8,
              textFont: Fonts.white12w500,
              gradient: LinearGradient(
                colors: [HaggleXColour.primary, HaggleXColour.primaryLight],
              ),
              text: "SIGN UP",
              onPressed: () {})
        ],
      );
    });
  }
}

class _PhoneNumber extends StatelessWidget {
  final double textFieldHeight;
  final double width;
  const _PhoneNumber({required this.textFieldHeight, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: textFieldHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(flex: 2, child: _CountryCode()),
          SizedBox(width: 5),
          Flexible(
            flex: 5,
            child: ShapelessTextField(
                label: "Enter your phone number",
                brightness: Brightness.dark,
                onSaved: (_) {},
                inputType: TextInputType.emailAddress,
                height: textFieldHeight,
                width: width),
          ),
        ],
      ),
    );
  }
}

class _CountryCode extends StatelessWidget {
  const _CountryCode();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final double height = constraints.maxHeight;
        final double width = constraints.maxWidth;
        return Container(
          height: height * 0.8,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: Border.all(color: Colors.grey),
              color: Colors.grey.shade100),
        );
      },
    );
  }
}
