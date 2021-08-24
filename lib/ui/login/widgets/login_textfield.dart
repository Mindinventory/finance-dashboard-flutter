import 'package:flutter/material.dart';
import 'package:finance_dashboard/theme/app_theme.dart';

class LoginTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final bool? obscureText;
  final TextInputType? textInputType;
  final AppTheme appTheme;

  const LoginTextField({
    required this.appTheme,
    this.hintText,
    this.controller,
    this.obscureText,
    this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    var _textStyle = TextStyle(
      color: appTheme.primaryColor,
      fontWeight: FontWeight.w300,
      fontSize: 16.0,
    );

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 25,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        cursorColor: appTheme.primaryColor,
        obscureText: obscureText ?? false,
        keyboardType: textInputType ?? TextInputType.text,
        style: _textStyle,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 7.0, right: 7.0),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          filled: true,
          fillColor: appTheme.darkAccentColor,
          hintText: hintText,
          hintStyle: _textStyle,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
