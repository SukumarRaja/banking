import 'package:dio/dio.dart';

Dio setupDio() {
  Dio dio = Dio(
    BaseOptions(
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 5),
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Content-Type'] = 'application/json';
        // options.headers['Authorization'] = 'Bearer TOKEN';
        return handler.next(options);
      },

      onError: (error, handler) {
        print("Error occurred: ${error.response?.data}");
        return handler.next(error);
      },
      onResponse: (response, handler) {
        print("Response Data: ${response.data}");
        return handler.next(response);
      },
    ),
  );

  return dio;
}
