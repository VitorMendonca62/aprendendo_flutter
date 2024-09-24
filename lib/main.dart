import 'package:aprendendo_flutter/routes/routes.dart';
import 'package:aprendendo_flutter/screens/login.view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FakeStoreApi',
      home: const LoginView(),
      color: Colors.black,
      getPages: Routes.routes,
    );
  }
}
