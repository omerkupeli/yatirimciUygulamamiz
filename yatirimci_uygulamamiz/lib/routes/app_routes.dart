import 'package:flutter/material.dart';
import 'package:yatirimci_uygulamamiz/screens/Auth/loginPage.dart';
import 'package:yatirimci_uygulamamiz/screens/Auth/registerPage.dart';
class AppRoutes {
  static const String loginScreen = '/login_screen';

  static const String kayitScreen = '/kayit_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    loginScreen: (context) => LoginScreen(),
    kayitScreen: (context) => KayitScreen(),
  };
}
