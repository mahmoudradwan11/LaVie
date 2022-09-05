import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://lavie.orangedigitalcenteregypt.com',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData(
      {required String url,
      Map<String, dynamic>? query,
      String lang = 'ar',
      String? token}) async {
    dio.options.headers = {
      'Accept': 'application/json',
      'Authorization': token ?? ''
    };
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData(
      {required String url,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data,
      String lang = 'ar',
      String? token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData(
      {required String url,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data,
      String lang = 'ar',
      String? token}) async {
    dio.options.headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> patchData(
      {required String url,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data,
      String lang = 'ar',
      String? token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token ?? ''
    };
    return await dio.patch(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
