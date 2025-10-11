import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/entities/game.dart';
import '../../../domain/entities/question.dart';
import '../../../data/repositories/game_repository_provider.dart';
import '../../../data/repositories/package_repository_provider.dart';

part 'game_provider.g.dart';

/// 現在のゲーム状態を管理するプロバイダー
@riverpod
class CurrentGame extends _$CurrentGame {
  @override
  Future<Game?> build(String gameId) async {
    final repository = await ref.read(gameRepositoryProvider.future);
    return await repository.getGame(gameId);
  }

  /// 回答を送信
  Future<Game?> submitAnswer(
    String answer,
    int timeRemaining,
    String correctPackageName,
  ) async {
    final game = state.value;
    if (game == null) return null;

    try {
      final repository = await ref.read(gameRepositoryProvider.future);
      final updatedGame = await repository.submitAnswer(
        gameId: gameId,
        packageName: correctPackageName,
        userAnswer: answer,
        timeRemaining: timeRemaining,
      );

      // 状態を更新（AsyncLoadingを使わずに直接更新）
      state = AsyncValue.data(updatedGame);
      return updatedGame;
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      return null;
    }
  }

  /// ゲームを終了
  Future<Game?> finishGame() async {
    try {
      final repository = await ref.read(gameRepositoryProvider.future);
      final finishedGame = await repository.finishGame(gameId);

      // 状態を更新（AsyncLoadingを使わずに直接更新）
      state = AsyncValue.data(finishedGame);
      return finishedGame;
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      return null;
    }
  }
}

/// 現在の問題を取得するプロバイダー
@riverpod
Future<Question?> currentQuestion(
  Ref ref,
  String gameId,
) async {
  final game = await ref.watch(currentGameProvider(gameId).future);
  if (game == null) return null;

  // 既に10ラウンド終了している場合はnullを返す
  if (game.rounds.length >= game.totalRounds) {
    return null;
  }

  // SKIPされていないラウンドのパッケージ名のみを除外リストに追加
  final usedPackages = game.rounds
      .where((r) => !r.isSkipped)
      .map((r) => r.packageName)
      .toList();

  final packageRepository = ref.read(packageRepositoryProvider);
  return await packageRepository.generateQuestion(usedPackages);
}

/// 現在のラウンド番号を取得するプロバイダー
@riverpod
int currentRound(Ref ref, String gameId) {
  final game = ref.watch(currentGameProvider(gameId)).value;
  if (game == null) return 0;
  return game.rounds.length + 1;
}

/// ゲームが終了したかどうかを判定するプロバイダー
@riverpod
bool isGameFinished(Ref ref, String gameId) {
  final game = ref.watch(currentGameProvider(gameId)).value;
  if (game == null) return false;
  return game.rounds.length >= game.totalRounds;
}

/// 結果画面用：ゲームデータを取得するプロバイダー（常に最新のデータを取得）
@riverpod
Future<Game?> gameResult(Ref ref, String gameId) async {
  // ref.read を使用して一度だけ取得（watchは使わない）
  final repository = await ref.read(gameRepositoryProvider.future);
  return await repository.getGame(gameId);
}
