import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_integrador_login/core/network/network.dart';
import 'package:proyecto_integrador_login/core/storage/storage_providers.dart';
import 'package:proyecto_integrador_login/features/auth/data/repositories/auth_repository.dart';
import 'package:proyecto_integrador_login/features/auth/data/services/auth_service.dart';
import 'package:proyecto_integrador_login/features/auth/presentation/providers/auth_state.dart';

// --- PROVIDERS DE INYECCIÓN ---

final apiClientProvider = Provider<ApiClient>((ref) {
  final dio = ref.watch(dioProvider);
  return ApiClient(dio);
});

final authServiceProvider = Provider<AuthService>((ref) {
  // 💡 Cambiado a ref.watch para mantener la reactividad del árbol de dependencias
  final apiClient = ref.watch(apiClientProvider);
  return AuthService(apiClient);
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  // 💡 Cambiado a ref.watch
  final authService = ref.watch(authServiceProvider);
  final storageService = ref.watch(storageServiceProvider);
  return AuthRepository(authService, storageService);
});

// --- NOTIFIER (GESTIÓN DE ESTADO) ---

class AuthNotifier extends Notifier<AuthState> {
  // Interceptamos el repositorio usando ref.watch en el build para asegurarnos
  // de que el notifier siempre apunte a la instancia activa del repositorio.
  late AuthRepository _repository;

  @override
  AuthState build() {
    _repository = ref.watch(authRepositoryProvider);

    // Ejecuta la verificación en el siguiente frame sin bloquear el build inicial
    Future.microtask(() => checkAuthStatus());

    return AuthState();
  }

  Future<void> login(String email, String password) async {
    state = state.copyWith(estado: AuthStatus.loading, error: null);
    try {
      final usuario = await _repository.login(
        username: email,
        password: password,
      );
      state = state.copyWith(
        usuario: usuario,
        estado: AuthStatus.authenticated,
        error: null,
      );
    } catch (e, _) {
      state = state.copyWith(
        usuario: null,
        estado: AuthStatus.unauthenticated,
        error: e.toString(),
      );
    }
  }

  Future<void> logout() async {
    await _repository.logout();
    state = state.copyWith(
      usuario: null,
      estado: AuthStatus.unauthenticated,
      error: null,
    );
  }

  Future<void> checkAuthStatus() async {
    state = state.copyWith(
      usuario: null,
      estado: AuthStatus.loading,
      error: null,
    );
    final accessToken = await _repository.checkAuthStatus();
    if (accessToken != null) {
      state = state.copyWith(estado: AuthStatus.authenticated);
    } else {
      state = state.copyWith(estado: AuthStatus.unauthenticated);
    }
  }
}

// --- PROVIDER DEL NOTIFIER ---

final authNotifierProvider = NotifierProvider<AuthNotifier, AuthState>(() {
  return AuthNotifier();
});
