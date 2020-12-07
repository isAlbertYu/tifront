import 'package:dio/dio.dart';

class TiHttp {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "http://localhost:8080/v1",
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  );

//  static Future<Map<String, dynamic>> getHttp(String path) async {
//    try {
//      Response<Map<String, dynamic>> response = await dio.get(path);
//      return response.data;
//    } catch (e) {
//      print("我的dio错误--${e}");
//      return null;
//    }
//  }
  static Future<dynamic> getHttp(String path) async {
    try {
      Response<dynamic> response = await _dio.get(path);
      return response.data;
    } catch (e) {
      print("我的dio错误--${e}");
      return null;
    }
  }

  static Future<dynamic> postHttp(String path, dynamic data) async {
    try {
      Response<dynamic> response = await _dio.post(path, data: data);
      return response.data;
    } catch (e) {
      print("我的post dio错误--${e}");
      return null;
    }
  }
}

//const String BASEURL = "http://localhost:9999/article_list";
