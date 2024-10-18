import 'package:aprendendo_flutter/components/form_input.component.dart';
import 'package:aprendendo_flutter/controllers/signup.controller.dart';
import 'package:aprendendo_flutter/routes/routes.dart';
import 'package:aprendendo_flutter/utils/types.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<StatefulWidget> createState() => _SignUpView();
}

class _SignUpView extends State<SignUpView> {
  final SignUpController _signUpController = Get.put(SignUpController());

  late final Map<String, FocusNode> nodes;

  late final FocusNode usernameNode;
  late final FocusNode emailNode;
  late final FocusNode passwordNode;
  late final FocusNode firstnameNode;
  late final FocusNode lastnameNode;
  late final FocusNode cityNode;
  late final FocusNode streetNode;
  late final FocusNode numberNode;
  late final FocusNode zipcodeNode;
  late final FocusNode latNode;
  late final FocusNode longNode;
  late final FocusNode phoneNode;

  @override
  void initState() {
    super.initState();
    usernameNode = FocusNode();
    emailNode = FocusNode();
    passwordNode = FocusNode();
    firstnameNode = FocusNode();
    lastnameNode = FocusNode();
    cityNode = FocusNode();
    streetNode = FocusNode();
    numberNode = FocusNode();
    zipcodeNode = FocusNode();
    latNode = FocusNode();
    longNode = FocusNode();
    phoneNode = FocusNode();
  }

  @override
  void dispose() {
    usernameNode.dispose();
    emailNode.dispose();
    passwordNode.dispose();
    firstnameNode.dispose();
    lastnameNode.dispose();
    cityNode.dispose();
    streetNode.dispose();
    numberNode.dispose();
    zipcodeNode.dispose();
    latNode.dispose();
    longNode.dispose();
    phoneNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(48, 16, 48, 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Form(
                      key: _signUpController.formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 20.0),
                            child: Text(
                              "FakeStoreAPI",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          FormInput(
                            controller: _signUpController.inputs["email"],
                            title: "Email",
                            placeholder: "exemplo@exemplo.com",
                            inputType: InputTypes.email,
                            jumpToNextNode: true,
                            nextNode: usernameNode,
                            currentNode: emailNode!,
                            validador: (String value) => value.isEmail,
                            value: 'John@gmail.com',
                          ),
                          FormInput(
                            controller: _signUpController.inputs["username"],
                            title: "Username",
                            placeholder: "username",
                            inputType: InputTypes.username,
                            jumpToNextNode: true,
                            nextNode: passwordNode,
                            currentNode: usernameNode!,
                            validador: (String value) => value.isNotEmpty,
                            value: "m38rmF${""}",
                          ),
                          FormInput(
                            controller: _signUpController.inputs["password"],
                            title: "Senha",
                            placeholder: "******",
                            inputType: InputTypes.password,
                            jumpToNextNode: true,
                            nextNode: firstnameNode,
                            currentNode: passwordNode!,
                            validador: (String value) =>
                                value.isNotEmpty && value.length >= 4,
                            value: 'johnd',
                          ),
                          FormInput(
                            controller: _signUpController.inputs["firstname"],
                            title: "Primeiro nome",
                            placeholder: "firstname",
                            inputType: InputTypes.firstname,
                            jumpToNextNode: true,
                            nextNode: lastnameNode,
                            currentNode: firstnameNode!,
                            validador: (String value) => value.isNotEmpty,
                            value: 'John',
                          ),
                          FormInput(
                            controller: _signUpController.inputs["lastname"],
                            title: "Último nome",
                            placeholder: "lastname",
                            inputType: InputTypes.lastname,
                            jumpToNextNode: true,
                            nextNode: cityNode,
                            currentNode: lastnameNode!,
                            validador: (String value) => value.isNotEmpty,
                            value: 'Doe',
                          ),
                          FormInput(
                            controller: _signUpController.inputs["city"],
                            title: "Cidade",
                            placeholder: "city",
                            inputType: InputTypes.city,
                            jumpToNextNode: true,
                            nextNode: streetNode,
                            currentNode: cityNode!,
                            validador: (String value) => value.isNotEmpty,
                            value: 'kilcoole',
                          ),
                          FormInput(
                            controller: _signUpController.inputs["street"],
                            title: "Rua",
                            placeholder: "street",
                            inputType: InputTypes.street,
                            jumpToNextNode: true,
                            nextNode: numberNode,
                            currentNode: streetNode!,
                            validador: (String value) => value.isNotEmpty,
                            value: '7835 new road',
                          ),
                          FormInput(
                            controller: _signUpController.inputs["number"],
                            title: "Número",
                            placeholder: "number",
                            inputType: InputTypes.number,
                            jumpToNextNode: true,
                            nextNode: zipcodeNode,
                            currentNode: numberNode!,
                            validador: (String value) => value.isNotEmpty,
                            value: "3",
                          ),
                          FormInput(
                            controller: _signUpController.inputs["zipcode"],
                            title: "CEP dos EUA",
                            placeholder: "zipcode",
                            inputType: InputTypes.zipcode,
                            jumpToNextNode: true,
                            nextNode: latNode,
                            currentNode: zipcodeNode!,
                            validador: (String value) => value.isNotEmpty,
                            value: "12926-3874",
                          ),
                          FormInput(
                            controller: _signUpController.inputs["lat"],
                            title: "Latitude",
                            placeholder: "lat",
                            inputType: InputTypes.lat,
                            jumpToNextNode: true,
                            nextNode: longNode,
                            currentNode: latNode!,
                            validador: (String value) => value.isNotEmpty,
                            value: "-37.3159",
                          ),
                          FormInput(
                            controller: _signUpController.inputs["long"],
                            title: "Longitude",
                            placeholder: "long",
                            inputType: InputTypes.long,
                            jumpToNextNode: true,
                            nextNode: phoneNode,
                            currentNode: longNode!,
                            validador: (String value) => value.isNotEmpty,
                            value: "81.1496",
                          ),
                          FormInput(
                            controller: _signUpController.inputs["phone"],
                            title: "Telefone dos EUA",
                            placeholder: "phone",
                            inputType: InputTypes.phone,
                            jumpToNextNode: false,
                            currentNode: phoneNode!,
                            validador: (String value) => value.isNotEmpty,
                            value: "1-570-236-7033",
                            submit: _signUpController.createUser,
                          ),
                          ElevatedButton(
                            onPressed: _signUpController.createUser,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1565C0),
                              padding:
                                  const EdgeInsets.fromLTRB(24, 12.0, 24, 12.0),
                            ),
                            child: const Text(
                              "Cadastrar",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                      ),
                      child: InkWell(
                        onTap: () => Get.offNamed(Routes.login),
                        child: const Text(
                          "Já tem conta? Faça o login!",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
