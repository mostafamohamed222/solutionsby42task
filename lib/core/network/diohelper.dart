import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  // use it in splash screen to work dio 
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://615d4dea12571a001720752d.mockapi.io/",
        receiveDataWhenStatusError: true,
      ),
    );
  }

  // use it to get news data from api
  static Future<Response> getNews(
      {required String url, required Map<String, dynamic> values}) async {
    return await dio.get(
      url,
      queryParameters: values,
    );
  }

  // use it to post request to api
  static Future<Response> postRequest(
      {required String url, required Map<String, dynamic> values}) async {
    return await dio.post(
      url,
      queryParameters: values,
    );
  }
}
