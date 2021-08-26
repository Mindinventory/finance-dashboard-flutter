import 'dart:ui';
import '../theme/app_theme.dart';
import '../theme/setup_locator.dart';

const kNameLimit = 50;
const kEmailLimit = 254;
const String kWelcomeBack = 'Welcome back!';
const String kHelloNikky = 'Hello, Nikky';
const String kSearch = 'Search';
const String kTransfermoneytoYourBank = 'Transfer money \nto Your Bank';
bool isLightDarkMode = false;
bool get isLightMode {
  return isLightDarkMode;
}
const double backgroundBorderRadius = 16.0;