import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'const_value.dart';

// ignore: avoid_classes_with_only_static_members
class AppColors {
  /// Static Colors
  static const Color white = Colors.white;
  static const Color darkCream = Color(0xFFFF945E);
  static const Color reportDropDownColor = Color(0xFF373B4D);
  static const Color blue = Color(0xFF32A7E2);
  static const Color purple = Color(0xFFB548C6);
  static const Color orange = Color(0xFFE18700);
  static const Color lightOrange = Color(0xFFFF8700);
  static const Color green = Color(0xFF22B07D);
  static const Color grey = Color(0xFF9593A0);

  static const Color sideMenu = Color(0xFF1F1D2B);
  static const Color greyBlack = Color(0xff252836);
  static const Color customBlueColor = Color(0xff525298);
  static const Color black = Colors.black;
  static const Color silver = Color(0xFFBAB9C1);

  /// Dynamic colors as per the selected theme.
  static Color get background {
    return isLightMode ? Colors.red : Colors.blue;
  }

  static Color get theme {
    return isLightMode ? Colors.blue : Colors.blue;
  }
}
