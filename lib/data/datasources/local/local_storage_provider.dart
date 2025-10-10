import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'local_storage.dart';

part 'local_storage_provider.g.dart';

/// SharedPreferencesのプロバイダー
@riverpod
Future<SharedPreferences> sharedPreferences(Ref ref) async {
  return await SharedPreferences.getInstance();
}

/// LocalStorageのプロバイダー
@riverpod
Future<LocalStorage> localStorage(Ref ref) async {
  final prefs = await ref.watch(sharedPreferencesProvider.future);
  return LocalStorage(prefs);
}
