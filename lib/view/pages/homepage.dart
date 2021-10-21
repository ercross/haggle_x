import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hagglex/stylesheet.dart';

class Homepage extends StatelessWidget {
  const Homepage();

  static const String route = "/";

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
    return Scaffold(
        bottomNavigationBar: Container(
          height: pageHeight * 0.12,
          width: pageWidth,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.grey.shade400))),
        ),
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          onTap: () =>
              WidgetsBinding.instance?.focusManager.primaryFocus?.unfocus(),
          child: Column(
            children: [_AppBar(height: pageHeight * 0.23, width: pageWidth)],
          ),
        ));
  }
}

class _AppBar extends StatelessWidget {
  final double height;
  final double width;
  const _AppBar({required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.only(
          top: height * 0.3,
          left: width * 0.07,
          right: width * 0.07,
          bottom: height * 0.03),
      color: HaggleXColour.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.check_circle,
                  color: Colors.white70, size: height * 0.23),
              Text("HaggleX", style: Fonts.white16w500),
              Icon(Icons.notifications, color: Colors.white)
            ],
          ),
        ],
      ),
    );
  }
}

class _Balance extends StatefulWidget {
  const _Balance();

  @override
  State<_Balance> createState() => _BalanceState();
}

class _BalanceState extends State<_Balance> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [],
      );
    });
  }
}
