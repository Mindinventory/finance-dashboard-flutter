import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:provider/provider.dart';

import '../ui/home_module/dashboard.dart';
import 'menu_controller.dart';

final routes = [
  GetPage(
    name: Routes.dashboard,
    page: () => MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MenuController(),
        ),
      ],
      child: const DashBoard(),
    ),
  ),
];

abstract class Routes {
  static const root = '/';
  static const dashboard = '/dashboard';
}
