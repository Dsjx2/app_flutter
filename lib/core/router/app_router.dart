import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_integrador_login/core/router/app_routes.dart';
import 'package:proyecto_integrador_login/features/auth/presentation/screens/screens.dart';
import 'package:proyecto_integrador_login/features/auth/presentation/providers/providers_presentation.dart';

final routerProvider = Provider<GoRouter>((ref) {
  // Escuchamos el estado completo de autenticación
  final status = ref.read(authNotifierProvider).estado;
  // Convertimos la escucha de Riverpod en un Listenable para GoRouter
  final refreshNotifier = ref.watch(routerRefreshProvider);

  return GoRouter(
    initialLocation: AppRoutes.splash,
    refreshListenable: refreshNotifier,
    redirect: (context, state) {
      final currentLocation = state.matchedLocation;
      final isGoingToSplash = currentLocation == AppRoutes.splash;
      final isGoingToLogin = currentLocation == AppRoutes.login;
      // 1. Si sigue cargando la sesión inicial, mantener o enviar a Splash
      if (status == AuthStatus.loading || status == AuthStatus.initial) {
        return isGoingToSplash ? null : AppRoutes.splash;
      }
      // 2. Si no está autenticado, obligar a ir a Login
      if (status == AuthStatus.unauthenticated) {
        return isGoingToLogin ? null : AppRoutes.login;
      }
      // 3. Si está autenticado e intenta ir a Login o Splash, mandarlo a Home
      if (status == AuthStatus.authenticated &&
          (isGoingToLogin || isGoingToSplash)) {
        return AppRoutes.home;
      }
      // 4. Si está autenticado y va a cualquier otra ruta válida, permitir la navegación
      return null;
    },

    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomeScreen(),
      ),
    ],

    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: Center(child: Text('Página no encontrada: ${state.uri}')),
    ),
  );
});

/// Adaptador para avisar a GoRouter cuando cambia el estado de authNotifierProvider
final routerRefreshProvider = Provider<Listenable>((ref) {
  final notifier = ValueNotifier(ref.read(authNotifierProvider).estado);
  ref.listen<AuthState>(
    authNotifierProvider,
    (_, next) => notifier.value = next.estado,
  );
  ref.onDispose(notifier.dispose);
  return notifier;
});

