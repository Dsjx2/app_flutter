import 'package:proyecto_integrador_login/features/auth/domain/models/usuario.dart';

enum AuthStatus { initial, loading, authenticated, unauthenticated }

class AuthState {
  final Usuario? usuario;
  final AuthStatus estado;
  final String? error;

  AuthState({this.usuario, this.estado = AuthStatus.initial, this.error});

  AuthState copyWith({Usuario? usuario, AuthStatus? estado, String? error}) {
    return AuthState(
      usuario: usuario ?? this.usuario,
      estado: estado ?? this.estado,
      error: error ?? this.error,
    );
  }
}
