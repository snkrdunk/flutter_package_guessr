import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/repositories/game_repository.dart';
import '../datasources/local/local_storage_provider.dart';
import 'game_repository_impl.dart';

part 'game_repository_provider.g.dart';

/// GameRepositoryのプロバイダー
@riverpod
Future<GameRepository> gameRepository(Ref ref) async {
  final localStorage = await ref.watch(localStorageProvider.future);
  return GameRepositoryImpl(localStorage);
}
