import 'dart:async';

import 'package:aprendendo_flutter/models/user/UserModel.dart';
import 'package:aprendendo_flutter/routes/routes.dart';
import 'package:aprendendo_flutter/services/user.service.dart';
import 'package:aprendendo_flutter/utils/alerts.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dioo;

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

  isLogged() async{
    return await _userService.getSession() != null;
  }

  enableTimer(bool goToHome) {
    Timer(const Duration(milliseconds: 1000), () {
      _loading = false;
      if (goToHome) {
        Get.offNamed(Routes.home);
      }
    });
  }

  handleLogin() async {
    if (!loading) {
      _loading = true;

      final String username = usernameController.text;
      if (username.length < 4) {
        Alert.warning(message: "Username inválido");
        enableTimer(false);
        return;
      }

      final String password = passwordController.text;
      if (password.length < 5) {
        Alert.warning(message: "Senha inválida");
        enableTimer(false);
        return;
      }
      final body = {
        "username": _usernameController.text,
        "password": _passwordController.text
      };
      dioo.Response response = await _userService.login(body);

      if (response.statusCode == 200) {
        final token = response.data["token"];
        Alert.sucess(message: "Login efetuado com sucesso");
        saveUser(token);
        enableTimer(true);
        return;
      } else if (response.statusCode == 401) {
        Alert.error(message: "Usuário ou senha estão incorretos.");
      } else {
        Alert.error(message: response.data);
      }
      enableTimer(false);
      return;
    }
    Alert.warning(message: "Espere o carregamento.");
  }

  saveUser(String token) async {
    UserModel user =
        await _userService.getUser(_usernameController.text, token);

    _userService.saveSession(user);
  }
}
