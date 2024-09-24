import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Alert {
  static sucess({required String message}) {
    Get.snackbar(
      "SUCESSO",
      message,
      shouldIconPulse: true,
      isDismissible: true,
      colorText: Colors.white,
      backgroundColor: Colors.green,
      icon: const Icon(
        Icons.check_circle,
        color: Colors.white,
        size: 32,
      ),
    );
  }

  static warning({required String message}) {
    Get.snackbar(
      "ALERTA",
      message,
      shouldIconPulse: true,
      isDismissible: true,
      colorText: Colors.white,
      backgroundColor: Colors.orange.shade400,
      icon: const Icon(
        Icons.warning_amber,
        color: Colors.white,
        size: 32,
      ),
    );
  }

  static error({required String message}) {
    Get.snackbar(
      shouldIconPulse: true,
      isDismissible: true,
      "ERRO",
      message,
      colorText: Colors.white,
      backgroundColor: Colors.red.shade400,
      icon: const Icon(
        Icons.error,
        color: Colors.white,
        size: 32,
      ),
    );
  }
}
