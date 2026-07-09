import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_integrador_login/features/auth/data/repositories/auth_repository.dart';
import 'package:proyecto_integrador_login/features/auth/presentation/providers/auth_state.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

class AuthNotifier extends Notifier<AuthState> {
  late final AuthRepository repository;

  @override
  AuthState build() {
    repository = ref.read(authRepositoryProvider);
    return AuthState();
  }

  Future<void> checkAuthStatus() async {
    state = state.copyWith(estado: AuthStatus.loading);
  }

}