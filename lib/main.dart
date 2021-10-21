import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hagglex/view/pages/authentication/email_verification.dart';
import 'package:hagglex/view/pages/authentication/sign_in.dart';

import 'view/pages/authentication/email_verification_success.dart';
import 'view/pages/authentication/sign_up.dart';
import 'view/pages/homepage.dart';
import 'view/pages/secondary_splash.dart';

void main() {
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //     statusBarColor: Colors.transparent,
  //     statusBarBrightness: Brightness.light,
  //     statusBarIconBrightness: Brightness.light));
  runApp(_HaggleX());
}

class _HaggleX extends StatelessWidget {
  _HaggleX();

  static const int _duration = 750;

  final List<GetPage<dynamic>> _pages = [
    GetPage(
        name: SecondarySplashScreen.route,
        page: () => const SecondarySplashScreen(),
        curve: Curves.easeInCubic,
        transitionDuration: const Duration(milliseconds: _duration),
        transition: Transition.size),
    GetPage(
        name: SignInPage.route,
        page: () => const SignInPage(),
        curve: Curves.easeInCubic,
        transitionDuration: const Duration(milliseconds: _duration),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: SignUpPage.route,
        page: () => const SignUpPage(),
        curve: Curves.easeInCubic,
        transitionDuration: const Duration(milliseconds: _duration),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: EmailVerificationPage.route,
        page: () => const EmailVerificationPage(),
        curve: Curves.easeIn,
        transitionDuration: const Duration(milliseconds: _duration),
        transition: Transition.fadeIn),
    GetPage(
        name: EmailVerificationSuccessPage.route,
        page: () => const EmailVerificationSuccessPage(),
        curve: Curves.easeIn,
        transitionDuration: const Duration(milliseconds: _duration),
        transition: Transition.zoom),
    GetPage(
        name: Homepage.route,
        page: () => const Homepage(),
        curve: Curves.easeIn,
        transitionDuration: const Duration(milliseconds: _duration),
        transition: Transition.upToDown),
  ];

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Homepage.route,
        getPages: _pages);
  }
}

class BlankPage extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final bool _includeSafeArea;
  const BlankPage({required this.child, this.backgroundColor})
      : _includeSafeArea = true;

  /// [BlankPage.withoutSafeArea] returns an empty page
  /// without SafeArea included in the widget tree
  const BlankPage.withoutSafeArea({required this.child, this.backgroundColor})
      : _includeSafeArea = false;

  @override
  Widget build(BuildContext context) {
    return _includeSafeArea
        ? Scaffold(
            backgroundColor: backgroundColor,
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: GestureDetector(
                  child: child,
                  onTap: () => WidgetsBinding
                      .instance?.focusManager.primaryFocus
                      ?.unfocus()),
            ))
        : Scaffold(
            backgroundColor: backgroundColor,
            resizeToAvoidBottomInset: false,
            body: GestureDetector(
                child: child,
                onTap: () => WidgetsBinding.instance?.focusManager.primaryFocus
                    ?.unfocus()));
  }
}
