import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/app/routes/app_pages.dart';
import 'package:getx/app/routes/app_routes.dart';
import 'package:getx/app/ui/android/initial_page.dart';
import 'package:getx/app/ui/theme/app_theme.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.INITIAL,
    title: 'Login Firebase',
    getPages: AppPages.routes,
    home: InitialPage(),
    theme: appThemeDate,
  ));
}
