import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_integrador_login/core/storage/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final storageServiceProvider = Provider<StorageService>((ref) {
  final prefs = ref.read(sharedPreferencesProvider);
  return StorageService(prefs);
});

