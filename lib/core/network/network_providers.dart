import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_integrador_login/core/network/network.dart';

final apiClientProvider = Provider<ApiClient>((ref) {
  final dio = ref.watch(dioProvider);
  return ApiClient(dio);
});
