import 'package:aprendendo_flutter/components/form_input.component.dart';
import 'package:aprendendo_flutter/controllers/login.controller.dart';
import 'package:aprendendo_flutter/utils/types.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<StatefulWidget> createState() => _LoginView();
}

class _LoginView extends State<LoginView> {
  final LoginController _loginController = Get.put(LoginController());

  late final FocusNode usernameNode;
  late final FocusNode passwordNode;

  @override
  void initState() {
    super.initState();
    usernameNode = FocusNode();
    passwordNode = FocusNode();
  }

  @override
  void dispose() {
    _loginController.usernameController.dispose();
    _loginController.passwordController.dispose();
    usernameNode.dispose();
    passwordNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(48, 0, 48, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _loginController.formKey,
                child: Column(
                  children: [
                    FormInput(
                      controller: _loginController.usernameController,
                      placeholder: "exemplo",
                      inputType: InputTypes.username,
                      jumpToNextNode: true,
                      nextNode: passwordNode,
                      currentNode: usernameNode,
                      validador: (String value) => value.length >= 4,
                      value: 'mor_2314',
                    ),
                    FormInput(
                      controller: _loginController.passwordController,
                      placeholder: "********",
                      inputType: InputTypes.password,
                      jumpToNextNode: false,
                      currentNode: passwordNode,
                      submit: _loginController.handleLogin,
                      validador: (String value) => value.length >= 8,
                      value: "83r5^_",
                    ),
                    ElevatedButton(
                      onPressed: _loginController.handleLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1565C0),
                        padding: const EdgeInsets.fromLTRB(24, 12.0, 24, 12.0),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
