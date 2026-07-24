import 'package:proyecto_integrador_login/features/auth/domain/models/usuario.dart';

class AuthSession {
  final Usuario usuario;
  final String accessToken;
  final String refreshToken;

  const AuthSession({
    required this.usuario,
    required this.accessToken,
    required this.refreshToken,
  });

  factory AuthSession.fromJson(Map<String, dynamic> json) {
    return AuthSession(
      usuario: Usuario.fromJson(json),
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
}
