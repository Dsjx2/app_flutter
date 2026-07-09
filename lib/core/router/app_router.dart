import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_integrador_login/core/router/app_routes.dart';
import 'package:proyecto_integrador_login/features/auth/presentation/screens/splash_screen.dart';

final _router = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(path: AppRoutes.splash, builder: (context, state) => const SplashScreen()),
  ],
  errorBuilder: (context, state) => Scaffold(
    appBar: AppBar(title: const Text('Error')),
    body: Center(child: Text('Página no encontrada: ${state.uri}')),
  ),
);

GoRouter get router => _router;
