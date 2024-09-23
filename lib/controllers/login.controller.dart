// ignore: depend_on_referenced_packages
import 'package:aprendendo_flutter/services/user.service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dioo;
import 'package:validators/validators.dart';

class LoginController extends GetxController {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _loading = false;

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get usernameController => _usernameController;
  TextEditingController get passwordController => _passwordController;
  bool get loading => _loading;

  final UserService _userService = Get.put(UserService());

  handleLogin() async {
    if (!loading) {
      _loading = true;

      final String? _username = usernameController.text;
      if (_username == null || _username.length < 4) {
        print("USERANME INVALIDO");
        return;
      }

      final String? _password = passwordController.text;
      if (_password == null || _password.length < 5) {
        print("SENHA INVALIDA");
        return;
      }
      final body = {
        "username": _usernameController.text,
        "password": _passwordController.text
      };
      dioo.Response response = await _userService.login(body);
      if (response.statusCode == 200) {
        final _token = response.data["token"];
      } else {
        print("RESPOINSE");
        print(response);
      }
    }
  }
}
