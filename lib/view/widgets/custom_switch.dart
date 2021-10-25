import 'package:flutter/material.dart';

class CustomSwitch<T> extends StatefulWidget {
  final double height;
  final double width;
  final double borderRadius;
  final Color active;
  final Color nonActive;
  final T initial;
  final Function(T) onChanged;
  final TextStyle activeFont;
  final TextStyle nonActiveFont;

  /// length of [values] must == 2
  final List<T> values;
  final Function(T) valueToString;
  const CustomSwitch(
      {required this.height,
      required this.values,
      required this.active,
      required this.initial,
      required this.onChanged,
      required this.activeFont,
      required this.nonActiveFont,
      required this.nonActive,
      required this.valueToString,
      required this.borderRadius,
      required this.width});

  @override
  State<CustomSwitch<T>> createState() => CustomSwitchState<T>();
}

class CustomSwitchState<T> extends State<CustomSwitch<T>> {
  late T _active;

  @override
  void initState() {
    _active = widget.initial;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    assert(widget.values.length == 2);
    return GestureDetector(
      onTap: () {
        setState(() => _active == widget.values.first
            ? _active = widget.values.last
            : _active = widget.values.first);
        widget.onChanged(_active);
      },
      child: Container(
        alignment: Alignment.center,
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          color: widget.nonActive,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _active == widget.values.last
                ? Expanded(
                    child: _SwitchButton(
                        isActive: _active == widget.values.first,
                        height: widget.height,
                        width: widget.width * 0.47,
                        activeFont: widget.activeFont,
                        nonActiveFont: widget.nonActiveFont,
                        value: widget.values.first,
                        stringValue: widget.valueToString(widget.values.first),
                        active: widget.active,
                        borderRadius: widget.borderRadius),
                  )
                : _SwitchButton(
                    isActive: _active == widget.values.first,
                    height: widget.height,
                    width: widget.width * 0.47,
                    activeFont: widget.activeFont,
                    nonActiveFont: widget.nonActiveFont,
                    value: widget.values.first,
                    stringValue: widget.valueToString(widget.values.first),
                    active: widget.active,
                    borderRadius: widget.borderRadius),
            _active == widget.values.first
                ? Expanded(
                    child: _SwitchButton(
                        isActive: _active == widget.values.last,
                        height: widget.height,
                        width: widget.width * 0.47,
                        activeFont: widget.activeFont,
                        nonActiveFont: widget.nonActiveFont,
                        value: widget.values.last,
                        stringValue: widget.valueToString(widget.values.last),
                        active: widget.active,
                        borderRadius: widget.borderRadius))
                : _SwitchButton(
                    isActive: _active == widget.values.last,
                    height: widget.height,
                    width: widget.width * 0.47,
                    activeFont: widget.activeFont,
                    nonActiveFont: widget.nonActiveFont,
                    value: widget.values.last,
                    stringValue: widget.valueToString(widget.values.last),
                    active: widget.active,
                    borderRadius: widget.borderRadius),
          ],
        ),
      ),
    );
  }
}

class _SwitchButton<T> extends StatelessWidget {
  final double width;
  final double height;
  final bool isActive;
  final Color active;
  final T value;
  final TextStyle activeFont;
  final TextStyle nonActiveFont;
  final String stringValue;
  final double borderRadius;
  const _SwitchButton(
      {required this.isActive,
      required this.height,
      required this.width,
      required this.activeFont,
      required this.nonActiveFont,
      required this.value,
      required this.stringValue,
      required this.active,
      required this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      alignment: Alignment.center,
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: isActive ? active : Colors.transparent,
      ),
      child: isActive
          ? Text(stringValue, textAlign: TextAlign.center, style: activeFont)
          : Text(stringValue,
              textAlign: TextAlign.center, style: nonActiveFont),
    );
  }
}
