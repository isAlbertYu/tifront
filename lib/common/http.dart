import 'package:dio/dio.dart';

class TiHttp {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: "http://localhost:9999",
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  );

  static Future<Map<String, dynamic>> getHttp(String path) async {
    try {
      Response<Map<String, dynamic>> response = await dio.get(path);
      return response.data;
    } catch (e) {
      print("我的dio错误--${e}");
      return null;
    }
  }
}

//const String BASEURL = "http://localhost:9999/article_list";
