import 'dart:async';

import 'package:aprendendo_flutter/models/user/UserModel.dart';
import 'package:aprendendo_flutter/routes/routes.dart';
import 'package:aprendendo_flutter/services/user.service.dart';
import 'package:aprendendo_flutter/utils/alerts.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dioo;

class SignUpController extends GetxController {
  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  final Map<String, TextEditingController> _inputs = {
    "username": TextEditingController(),
    "email": TextEditingController(),
    "password": TextEditingController(),
    "firstname": TextEditingController(),
    "lastname": TextEditingController(),
    "city": TextEditingController(),
    "street": TextEditingController(),
    "number": TextEditingController(),
    "zipcode": TextEditingController(),
    "lat": TextEditingController(),
    "long": TextEditingController(),
    "phone": TextEditingController(),
  };
  get inputs => _inputs;

  bool _loading = false;
  bool get loading => _loading;

  final UserService _userService = Get.put(UserService());

  enableTimer(bool goToLogin) {
    Timer(const Duration(milliseconds: 1000), () {
      _loading = false;
      if (goToLogin) {
        Get.offNamed(Routes.login);
      }
    });
  }

  createUser() async {
    if (!loading) {
      _loading = true;

      List<String> rootInputs = ["email", "username", "password", "phone"];
      List<String> nameInputs = ["firstname", "lastname"];
      List<String> addressInputs = [
        "city",
        "street",
        "number",
        "zipcode",
      ];
      List<String> geoLocationInputs = ["lat", "long"];

      Map<String, List<String>> allInputs = {
        "rootInputs": rootInputs,
        "nameInputs": nameInputs,
        "addressInputs": addressInputs,
        "geoLocationInputs": geoLocationInputs,
      };

      Map<String, dynamic> body = {};

      for (var rootInput in allInputs.keys) {
        // print(body);
        // print("################ BODY ###############");
        for (var input in allInputs[rootInput]!) {
          // print(_inputs);
          // print("############");
          // print(input);
          if (_inputs[input]!.text.isNotEmpty) {
            String replacedRootInput = rootInput.replaceAll("Inputs", "");
            if (["name", "address"].contains(replacedRootInput)) {
              if (!(body.keys.contains(replacedRootInput))) {
                body[replacedRootInput] = {};
              }
              body[replacedRootInput][input] = _inputs[input]!.text;
            }
            else if (rootInput == "geoLocationInputs") {
              print(body["address"]);
              if (!(body["address"].keys.contains("geolocation"))) {
                body["address"]["geolocation"] = {};
              }
              body["address"]["geolocation"][input] = _inputs[input]!.text;
            } else {
              body[input] = _inputs[input]!.text;
            }
          } else {
            Alert.error(message: "O campo $input está inválido");
            enableTimer(false);
          }
        }
      }
      print(body);
      dioo.Response response = await _userService.createUser(body);

      if (response.statusCode == 200) {
        Alert.sucess(message: "Cadastro de usuário efetuado com sucesso");
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
}
