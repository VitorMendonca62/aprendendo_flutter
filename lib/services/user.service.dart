import 'dart:convert';

import 'package:aprendendo_flutter/models/user/UserModel.dart';
import 'package:dio/dio.dart' as dioo;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  final dioo.Dio _dio = Get.put(dioo.Dio());
  String baseUrl = "https://fakestoreapi.com";

  Future login(dynamic body) async {
    try {
      String url = '$baseUrl/auth/login';

      dioo.Response response = await _dio.post(
        url,
        data: body,
      );

      return response;
    } on dioo.DioException catch (e) {
      return e.response;
    }
  }

  Future getAll() async {
    try {
      String url = '$baseUrl/users';

      dioo.Response response = await _dio.get(url);

      return response;
    } on dioo.DioException catch (e) {
      return e.response;
    }
  }

  saveSession(UserModel user) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setString("user", json.encode(user.toJson()));
  }

  getSession() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getString("user");
  }

  Future<UserModel> getUser(
    String username,
    String token,
  ) async {
    List<dynamic> dataDynamic = (await getAll()).data;

    Map<String, dynamic> userMap = dataDynamic.firstWhere((user) {
      return user["username"] == username;
    });

    userMap["token"] = token;

    UserModel user = UserModel.fromJson(userMap);
    return user;
  }
}
