import 'package:proyecto_integrador_login/core/network/network.dart';
import 'package:proyecto_integrador_login/features/auth/domain/models/auth_session.dart';

class AuthService {
  final ApiClient _apiClient;
  AuthService(this._apiClient);

  Future<AuthSession> login({
    required String username,
    required String password,
  }) async {
    final response = await _apiClient.post(
      '/auth/login',
      data: {'username': username, 'password': password},
    );
    return AuthSession.fromJson(response.data);
  }
}
