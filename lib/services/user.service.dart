import 'package:dio/dio.dart' as dioo;
import 'package:get/get.dart';

class UserService {
  final dioo.Dio _dio = Get.put(dioo.Dio());

  Future login(dynamic body) async {
    try {
      String baseUrl = "https://fakestoreapi.com";

      String url = '$baseUrl/auth/login';
      dioo.Response? response;

      response = await _dio.post(
        url,
        data: body,
      );

      return response;
    } on dioo.DioException catch (e) {
      print("AAAAAAAAAAAAAAAAAA");
      print(e);
      return e.response;
    }
  }
}
