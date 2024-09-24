import 'package:aprendendo_flutter/screens/login.view.dart';
import 'package:get/get.dart';

class Routes {
  static String login = "/";
  static String home = "/home";

  static final routes = [
    GetPage(name: login, page: () => const LoginView()),
    GetPage(name: home, page: () => const LoginView()),
  ];
}
