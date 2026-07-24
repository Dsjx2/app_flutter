import 'package:proyecto_integrador_login/features/auth/data/services/auth_service.dart';
import 'package:proyecto_integrador_login/core/storage/storage.dart';
import 'package:proyecto_integrador_login/features/auth/domain/models/usuario.dart';

class AuthRepository {
  final AuthService _authService;
  final StorageService _storageService;

  AuthRepository(this._authService, this._storageService);

  Future<Usuario> login({
    required String username,
    required String password,
  }) async {
    final session = await _authService.login(
      username: username,
      password: password,
    );
    await Future.wait([
      _storageService.saveString(StorageKeys.accessToken, session.accessToken),
      _storageService.saveString(
        StorageKeys.refreshToken,
        session.refreshToken,
      ),
      _storageService.saveBool(StorageKeys.isLoggedIn, true),
    ]);
    return session.usuario;
  }

  Future<String?> checkAuthStatus() async {
    final accessToken = _storageService.getString(StorageKeys.accessToken);
    return accessToken;
  }

  Future<void> logout() async {
    await Future.wait([
      _storageService.remove(StorageKeys.accessToken),
      _storageService.remove(StorageKeys.refreshToken),
      _storageService.remove(StorageKeys.isLoggedIn),
    ]);
  }
}
