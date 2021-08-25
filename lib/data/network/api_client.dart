import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';

part 'api_client.g.dart'; 

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, String baseUrl) {
    dio.options = BaseOptions(receiveTimeout: 5000, connectTimeout: 5000);
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      print(
          'REQUEST[${options.method}] => PATH: ${options.baseUrl}${options.path}');
      if (options.method == 'GET') {
        print('REQUEST PARAMS: ${options.queryParameters.toString()}');
      }
      if (options.method == 'POST') {
        print('REQUEST BODY: ${options.data.toString()}');
      }
      return handler.next(options);
    }, onResponse: (Response e, handler) {
      print('RAW RESPONSE: ' + e.toString());
      return handler.next(e);
    }, onError: (DioError e, handler) {
      print('RAW ERROR RESPONSE: ' + e.response.toString());
      return handler.next(e);
    }));
    return _ApiClient(dio, baseUrl: baseUrl);
  }
}