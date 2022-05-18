import 'package:flutter/material.dart';
import '../constant/constant_public.dart';

class ThemeColors {
  Color get primaryColor {
    return isLightMode ? Colors.black : const Color(0xFF262628);
  }

  static Color get primaryColorDark {
    return isLightMode ? Colors.black : const Color(0xFF1F1D2B);
  }

  static Color get primaryColorLight {
    return isLightMode ? const Color(0xFF262628) : const Color(0xFF262628);
  }

  static Color get accentColor {
    return isLightMode ? const Color(0xFFFF6600) : const Color(0xFFFFC502);
  }

  static Color get backgroundColor {
    return isLightMode ? const Color(0xFFF9F9F9) : const Color(0xFF121212);
  }

  static Color get zoomInOutTextColor {
    return isLightMode
        ? Colors.black.withOpacity(0.4)
        : Colors.white.withOpacity(0.7);
  }

  static Color get scaffoldBackgroundColor {
    return isLightMode ? Colors.white : const Color(0xFF121212);
  }

  static Color get selectedTextColor {
    return isLightMode ? Colors.black : Colors.white;
  }

  static Color get highlightedTextColor {
    return isLightMode
        ? const Color.fromARGB(255, 255, 92, 92)
        : const Color.fromARGB(255, 92, 255, 92);
  }
}
