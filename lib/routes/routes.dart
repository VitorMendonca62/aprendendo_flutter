import 'package:aprendendo_flutter/screens/home.view.dart';
import 'package:aprendendo_flutter/screens/login.view.dart';
import 'package:aprendendo_flutter/screens/signup.view.dart';
import 'package:get/get.dart';

class Routes {
  static String login = "/";
  static String home = "/home";
  static String signup = "/signup";

  static final routes = [
    GetPage(name: login, page: () => const LoginView()),
    GetPage(name: home, page: () => const HomeView()),
    GetPage(name: signup, page: () => const SignUpView()),
  ];
}
