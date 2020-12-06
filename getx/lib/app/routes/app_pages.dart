import 'package:get/get.dart';
import 'package:getx/app/bindings/login_binding.dart';
import 'package:getx/app/routes/app_routes.dart';
import 'package:getx/app/ui/android/home_page.dart';
import 'package:getx/app/ui/android/initial_page.dart';
import 'package:getx/app/ui/android/login_page.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.INITIAL, page: () => InitialPage()),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(name: Routes.HOME, page: () => HomePage())
  ];
}
