import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:hagglex/stylesheet.dart';

import '../../main.dart';
import 'authentication/sign_in.dart';

class SecondarySplashScreen extends StatefulWidget {
  const SecondarySplashScreen();

  static const String route = "/splash";

  @override
  _SecondarySplashScreenState createState() => _SecondarySplashScreenState();
}

class _SecondarySplashScreenState extends State<SecondarySplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _logoAnimationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _logoAnimationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _logoAnimationController,
      curve: Curves.easeIn,
    ));
    _logoAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed)
        Get.toNamed(
          SignInPage.route,
        );
    });
    _logoAnimationController.forward();
  }

  @override
  void dispose() {
    _logoAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark));
    return BlankPage.withoutSafeArea(
        child: Container(
            color: HaggleXColour.primary,
            alignment: Alignment.center,
            child: _FadeInLogo(_animation)));
  }
}

class _FadeInLogo extends StatelessWidget {
  final Animation<double> animation;
  const _FadeInLogo(this.animation);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light));
    final Size size = MediaQuery.of(context).size;
    final double imageHeight = size.height * 0.5;
    final double imageWidth = size.width * 0.6;
    return FadeTransition(
        opacity: animation,
        child: Image.asset("assets/images/white_logo.png",
            fit: BoxFit.contain, height: imageHeight, width: imageWidth));
  }
}
