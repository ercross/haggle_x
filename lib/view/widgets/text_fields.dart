import 'package:flutter/material.dart';

import '../../stylesheet.dart';

class ShapelessTextField extends StatelessWidget {
  final double height;
  final double width;
  final Function(String?) onSaved;
  final String label;
  final Brightness brightness;
  final bool _forPassword;
  final TextInputType inputType;
  const ShapelessTextField(
      {required this.label,
      required this.brightness,
      required this.onSaved,
      required this.inputType,
      required this.height,
      required this.width})
      : _forPassword = false;

  const ShapelessTextField.forPassword(
      {required this.brightness,
      required this.onSaved,
      required this.height,
      required this.width})
      : _forPassword = true,
        inputType = TextInputType.text,
        label = "";

  @override
  Widget build(BuildContext context) {
    return _forPassword
        ? _ForPassword(
            brightness: brightness,
            onSaved: onSaved,
            height: height,
            width: width)
        : Container(
            alignment: Alignment.bottomCenter,
            height: height,
            width: width,
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border(
                    bottom: BorderSide(
                        width: 1,
                        color: brightness == Brightness.dark
                            ? Colors.black
                            : Colors.white54))),
            child: TextFormField(
              textAlignVertical: TextAlignVertical.bottom,
              toolbarOptions: ToolbarOptions(
                  paste: true, copy: true, cut: true, selectAll: true),
              expands: true,
              minLines: null,
              maxLines: null,
              onSaved: onSaved,
              style: brightness == Brightness.dark
                  ? Fonts.black14w400
                  : Fonts.white14w400,
              keyboardType: inputType,
              cursorHeight: height * 0.3,
              cursorColor: brightness == Brightness.dark
                  ? Colors.black87
                  : Colors.white70,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                labelText: label,
                labelStyle: brightness == Brightness.dark
                    ? Fonts.black12w500
                    : Fonts.white12w300,
              ),
            ));
  }
}

class _ForPassword extends StatefulWidget {
  final double height;
  final double width;
  final Function(String?) onSaved;
  final Brightness brightness;

  _ForPassword(
      {required this.brightness,
      required this.onSaved,
      required this.height,
      required this.width});

  @override
  __ForPasswordState createState() => __ForPasswordState();
}

class __ForPasswordState extends State<_ForPassword> {
  bool _obscureText = true;
  late FocusNode _focusNode;
  bool _hasText = false;
  String _label = "Password (Min 8 characters)";

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: widget.width,
        height: widget.height,
        padding: EdgeInsets.only(bottom: widget.height * 0.1),
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border(
                bottom: BorderSide(
                    width: 1,
                    color: widget.brightness == Brightness.dark
                        ? Colors.black
                        : Colors.white54))),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                textAlignVertical: TextAlignVertical.bottom,
                toolbarOptions: ToolbarOptions(
                    paste: true, copy: true, cut: true, selectAll: true),
                onSaved: widget.onSaved,
                focusNode: _focusNode,
                style: widget.brightness == Brightness.dark
                    ? Fonts.black14w400
                    : Fonts.white14w400,
                keyboardType: TextInputType.text,
                cursorHeight: widget.height * 0.3,
                cursorColor: widget.brightness == Brightness.dark
                    ? Colors.black87
                    : Colors.white70,
                obscureText: _obscureText,
                onChanged: (input) {
                  if (input.isNotEmpty)
                    setState(() => _hasText == true);
                  else
                    setState(() => _hasText == true);
                },
                onFieldSubmitted: (_) => setState(() => _focusNode.unfocus()),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText:
                      _focusNode.hasFocus || _hasText ? "Password" : _label,
                  contentPadding: EdgeInsets.zero,
                  labelStyle: widget.brightness == Brightness.dark
                      ? Fonts.black12w500
                      : Fonts.white12w300,
                ),
              ),
            ),
            Visibility(
              visible: _focusNode.hasFocus,
              child: IconButton(
                  splashRadius: null,
                  onPressed: () {
                    _obscureText
                        ? setState(() => _obscureText = false)
                        : setState(() => _obscureText = true);
                  },
                  icon: Icon(
                    _obscureText
                        ? Icons.visibility
                        : Icons.visibility_off_rounded,
                    color: widget.brightness == Brightness.light
                        ? Colors.white
                        : Colors.black,
                  )),
            )
          ],
        ));
    ;
  }
}
