import 'package:finance_dashboard/ui/home_module/home_page.dart';
import 'package:finance_dashboard/ui/login/login_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:finance_dashboard/ui/spalsh_module/spalsh_page.dart';

final routes = [
  GetPage(
    name: Routes.root,
    page: () => SplashPage(),
  ),
  GetPage(
    name: Routes.login,
    page: () => LoginPage(),
  ),
  GetPage(
    name: Routes.home,
    page: () => HomePage(),
  ),
];

abstract class Routes {
  static const root = '/';
  static const login = '/login';
  static const home = '/home';
}
