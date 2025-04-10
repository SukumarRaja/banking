import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../modles/auth_response.dart';

part 'auth_api_client.g.dart';

@RestApi(baseUrl: "http://localhost:3000/api")
abstract class AuthApiClient {
  factory AuthApiClient(Dio dio, {String baseUrl}) = _AuthApiClient;

  @POST('/auth/login')
  Future<AuthResponse> login(@Body() Map<String, dynamic> body);
}
