import '../domain/entities/user_entities.dart';
import '../domain/repositories/auth_repository.dart';
import 'api/auth_api_client.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiClient apiClient;

  AuthRepositoryImpl({required this.apiClient});

  @override
  Future<UserEntity> login(String email, String password) async {
    final response = await apiClient.login({
      'email': email,
      'password': password,
    });
    return UserEntity(id: response.userId, token: response.token);
  }
}
