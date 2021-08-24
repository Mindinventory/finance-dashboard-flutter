import 'package:get_it/get_it.dart';

import 'app_theme.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
  locator.registerSingleton(AppTheme());
}
