import 'package:get/get_navigation/src/routes/get_route.dart';

import '../ui/home_module/dashboard.dart';

final routes = [
  GetPage(
    name: Routes.dashboard,
    page: () => const DashBoard(),
  ),
];

abstract class Routes {
  static const root = '/';
  static const dashboard = '/dashboard';
}
