import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:finance_dashboard/ui/app.dart';

import 'constant/color_constant.dart';
import 'theme/setup_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // registering for theme
  await setupLocator();

  // To Set the fix device orientation.
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  /*// Register the DB providers and init the DB
  var dbInitializer = DbInitializer.instance;
  dbInitializer.addProvider(UserSQLiteProvider.instance);
  dbInitializer.addProvider(SelectedOrganizationSQLiteProvider.instance);
  dbInitializer.addProvider(ClassTypeSQLiteProvider.instance);
  dbInitializer.addProvider(NotificationSQLiteProvider.instance);
  await dbInitializer.initialize();*/

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: AppColors.white, // navigation bar color
    statusBarColor: AppColors.white, // status bar color
  ));

  await runZonedGuarded(() async {
    runApp(App());
  }, (Object error, StackTrace stack) async {
    print('On Error : ${error.toString()}');
  });
}
