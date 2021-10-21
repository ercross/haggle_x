import 'package:flutter/material.dart';

class FadeInWidget extends StatefulWidget {
  final Widget child;

  /// [duration] is in milliseconds
  final int duration;
  const FadeInWidget(this.child, {required this.duration});

  @override
  State<FadeInWidget> createState() => FadeInWidgetState();
}

class FadeInWidgetState extends State<FadeInWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _logoAnimationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _logoAnimationController = AnimationController(
      duration: Duration(milliseconds: widget.duration),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _logoAnimationController,
      curve: Curves.easeIn,
    ));
    _logoAnimationController.forward();
  }

  @override
  void dispose() {
    _logoAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      FadeTransition(opacity: _animation, child: widget.child);
}
