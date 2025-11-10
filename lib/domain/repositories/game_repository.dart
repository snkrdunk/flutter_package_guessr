import '../entities/game.dart';

/// ゲームリポジトリのインターフェース
abstract class GameRepository {
  /// 新しいゲームを作成
  Future<Game> createGame(String playerName);

  /// ゲームIDでゲームを取得
  Future<Game?> getGame(String gameId);

  /// ラウンドの回答を送信
  Future<Game> submitAnswer({
    required String gameId,
    required String packageName,
    required String userAnswer,
    required int timeRemaining,
  });

  /// 問題をスキップ（回答数にカウントせず、問題だけ変更）
  Future<Game> skipQuestion({
    required String gameId,
    required String packageName,
  });

  /// ゲームを終了
  Future<Game> finishGame(String gameId);

  /// 全てのゲーム履歴を取得
  Future<List<Game>> getAllGames();

  /// プレイヤー名でゲーム履歴を取得
  Future<List<Game>> getGamesByPlayer(String playerName);
}
