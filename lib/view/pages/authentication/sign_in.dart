import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hagglex/main.dart';
import 'package:hagglex/stylesheet.dart';
import 'package:hagglex/view/pages/authentication/sign_up.dart';
import 'package:hagglex/view/pages/homepage.dart';
import 'package:hagglex/view/widgets/buttons.dart';
import 'package:hagglex/view/widgets/text_fields.dart';

class SignInPage extends StatefulWidget {
  const SignInPage();

  static const String route = "/sign-in";

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, String> _credentials = {};

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
    final double textFieldHeight = pageHeight * 0.06;
    return BlankPage(
        backgroundColor: HaggleXColour.primary,
        child: Container(
          height: pageHeight,
          width: pageWidth,
          padding: EdgeInsets.only(
              right: pageWidth * 0.07,
              left: pageWidth * 0.07,
              top: pageHeight * 0.1,
              bottom: pageHeight * 0.25),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Welcome!", style: Fonts.white35w600)),
                SizedBox(height: pageHeight * 0.04),
                ShapelessTextField(
                    label: "Email Address",
                    inputType: TextInputType.emailAddress,
                    brightness: Brightness.light,
                    onSaved: (_) {},
                    height: textFieldHeight,
                    width: pageWidth),
                SizedBox(height: pageHeight * 0.02),
                ShapelessTextField.forPassword(
                    brightness: Brightness.light,
                    onSaved: (_) {},
                    height: textFieldHeight,
                    width: pageWidth),
                SizedBox(height: pageHeight * 0.04),
                Align(
                    alignment: Alignment.centerRight,
                    child: Text("Forgot Passowrd", style: Fonts.white12w300)),
                SizedBox(height: pageHeight * 0.04),
                HorizontalButton(
                    height: pageHeight * 0.06,
                    width: pageWidth,
                    color: HaggleXColour.accent,
                    text: "LOG IN",
                    onPressed: () => Get.toNamed(Homepage.route)),
                SizedBox(height: pageHeight * 0.02),
                TextButton(
                    onPressed: () => Get.toNamed(SignUpPage.route),
                    child: RichText(
                      text: TextSpan(
                          text: "New User? ",
                          style: Fonts.white13w300,
                          children: [
                            TextSpan(
                              text: "Create a new account",
                              style: Fonts.white13w300,
                            )
                          ]),
                    ))
              ],
            ),
          ),
        ));
  }

  void _login() {
    _formKey.currentState!.save();
  }
}
