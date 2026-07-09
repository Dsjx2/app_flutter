import 'package:flutter/material.dart';
import 'package:proyecto_integrador_login/core/router/app_router.dart';
import 'core/theme/app_theme.dart';

class TaskFlowApp extends StatelessWidget {
  const TaskFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'TaskFlow',
      theme: Apptheme.lightTheme,
      routerConfig: router,
    );
  }
}
