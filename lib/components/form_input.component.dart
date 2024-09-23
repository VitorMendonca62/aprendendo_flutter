import 'package:aprendendo_flutter/utils/types.dart';
import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final InputTypes inputType;
  final bool jumpToNextNode;
  final bool Function(String str) validador;
  final FocusNode currentNode;
  final FocusNode? nextNode;
  final void Function()? submit;
  final String value;

  const FormInput({
    super.key,
    required this.controller,
    required this.placeholder,
    required this.inputType,
    required this.jumpToNextNode,
    required this.validador,
    required this.currentNode,
    required this.value,
    this.nextNode,
    this.submit,
  });

  TextInputType _getKeyboardType() {
    switch (inputType) {
      case InputTypes.username:
        return TextInputType.text;
      case InputTypes.password:
        return TextInputType.text;
    }
  }

  void _nextNode(BuildContext context, String value) {
    if (jumpToNextNode) {
      return FocusScope.of(context)
          .requestFocus(validador(value) ? nextNode : currentNode);
    }

    if (validador(value)) {
      return submit!();
    }
    return FocusScope.of(context).requestFocus(currentNode);
  }

  @override
  Widget build(BuildContext context) {
    controller.text = value;
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        keyboardType: _getKeyboardType(),
        obscureText: inputType == InputTypes.password,
        enableSuggestions: inputType != InputTypes.password,
        autocorrect: inputType != InputTypes.password,
        cursorColor: Colors.black,
        controller: controller,
        focusNode: currentNode,
        onFieldSubmitted: (value) => _nextNode(context, value),
        style: const TextStyle(fontSize: 16.0),
        decoration: InputDecoration(
          hintText: placeholder,
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.fromLTRB(18, 8, 18, 8),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black45,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(22),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(22),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black45,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(22),
          ),
        ),
      ),
    );
  }
}
