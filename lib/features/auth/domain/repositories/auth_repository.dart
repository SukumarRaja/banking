import '../entities/user_entities.dart';

abstract class AuthRepository {
  Future<UserEntity> login(String email, String password);
}
