import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'const_value.dart';

// ignore: avoid_classes_with_only_static_members
class AppColors {
  /// Static Colors
  static const Color white = Colors.white;
  static const Color sideMenu = Color(0xFF1F1D2B);
  static const Color greyBlack = Color(0xff252836);
  static const Color customBlueColor = Color(0xff525298);

  /// Dynamic colors as per the selected theme.
  static Color get background {
    return isLightMode ? Colors.red : Colors.blue;
  }

  static Color get theme {
    return isLightMode ? Colors.blue : Colors.blue;
  }
}
