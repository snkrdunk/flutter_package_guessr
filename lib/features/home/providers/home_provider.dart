import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/entities/game.dart';
import '../../../data/repositories/game_repository_provider.dart';

part 'home_provider.g.dart';

/// ゲーム開始を管理するプロバイダー
@riverpod
class GameStarter extends _$GameStarter {
  @override
  FutureOr<Game?> build() {
    return null;
  }

  /// 新しいゲームを開始
  Future<Game> startGame(String playerName) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final repository = await ref.read(gameRepositoryProvider.future);
      return await repository.createGame(playerName);
    });

    return state.value!;
  }
}

/// 最後に使用したプレイヤー名を取得するプロバイダー
@riverpod
Future<String?> lastPlayerName(Ref ref) async {
  final localStorage = await ref.watch(
    gameRepositoryProvider.future,
  );
  // TODO: LocalStorageから取得する実装
  return null;
}
