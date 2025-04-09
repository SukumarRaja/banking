import 'package:dio/dio.dart';

Dio setupDio() {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://localhost:8000/api",
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 5),
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Authorization'] = 'Bearer TOKEN';
        return handler.next(options);
      },

      onError: (error, handler) {
        print("Error occurred: ${error.response?.data}");
        return handler.next(error);
      },
    ),
  );

  return dio;
}
