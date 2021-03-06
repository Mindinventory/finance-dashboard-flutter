import 'package:flutter/material.dart';

import '../constant/constant_public.dart';
import 'theme_colors.dart';

class AppTheme {
  late Brightness brightness;

  Color get primaryColor => ThemeColors.primaryColorDark;

  Color get accentColor => ThemeColors.accentColor;

  Color get darkAccentColor => ThemeColors.scaffoldBackgroundColor;

  Color get darkPrimaryColor => ThemeColors.primaryColorDark;

  Color get indicatorColor => const Color(0xff0E1D36);

  Color get buttonColor => const Color(0xff3B3B3B);

  Color get hintColor => const Color(0xff280C0B);

  Color get highlightColor => const Color(0xff372901);

  Color get hoverColor => const Color(0xff3A3A3B);

  Color get focusColor => const Color(0xff0B2512);

  Color get disabledColor => Colors.grey;

  Color get textSelectionColor => Colors.black;

  Color get cardColor => const Color(0xFF151515);


  ThemeData get lightTheme {
    return ThemeData.light().copyWith(
      brightness: Brightness.light,
      primaryColor: primaryColor,
      accentColor: accentColor,
      primaryColorDark: ThemeColors.primaryColorDark,
      primaryColorLight: ThemeColors.primaryColorLight,
      highlightColor: ThemeColors.primaryColorLight,
      backgroundColor: ThemeColors.backgroundColor,
    );
  }

  ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      brightness: Brightness.light,
      primaryColor: primaryColor,
      accentColor: accentColor,
      primaryColorDark: ThemeColors.primaryColorDark,
      primaryColorLight: ThemeColors.primaryColorLight,
      highlightColor: ThemeColors.primaryColorLight,
      backgroundColor: ThemeColors.backgroundColor,
    );
  }

  ThemeData get theme {
    return !isLightMode ? darkTheme : lightTheme;
  }
}
