import 'package:uuid/uuid.dart';
import '../../domain/entities/game.dart';
import '../../domain/repositories/game_repository.dart';
import '../datasources/local/local_storage.dart';

/// ゲームリポジトリの実装（ローカルストレージ版）
class GameRepositoryImpl implements GameRepository {
  final LocalStorage _localStorage;
  final Uuid _uuid = const Uuid();

  GameRepositoryImpl(this._localStorage);

  @override
  Future<Game> createGame(String playerName) async {
    final game = Game(
      id: _uuid.v4(),
      playerName: playerName,
      totalRounds: 11, // パッケージ数に合わせて修正
      rounds: [],
      correctCount: 0,
      totalScore: 0,
      createdAt: DateTime.now(),
      finishedAt: null,
    );

    // ローカルストレージに保存
    await _saveGame(game);

    // 最後のプレイヤー名を保存
    await _localStorage.saveLastPlayerName(playerName);

    return game;
  }

  @override
  Future<Game?> getGame(String gameId) async {
    final games = _localStorage.getGames();
    final gameData = games.firstWhere(
      (g) => g['id'] == gameId,
      orElse: () => <String, dynamic>{},
    );

    if (gameData.isEmpty) return null;

    return Game.fromJson(gameData);
  }

  @override
  Future<Game> submitAnswer({
    required String gameId,
    required String packageName,
    required String userAnswer,
    required int timeRemaining,
  }) async {
    final game = await getGame(gameId);
    if (game == null) {
      throw Exception('Game not found: $gameId');
    }

    final isSkipped = userAnswer == 'SKIP';
    final isCorrect = !isSkipped && userAnswer == packageName;
    final score = isCorrect ? 100 + timeRemaining : 0;

    final newRound = Round(
      packageName: packageName,
      timeRemaining: timeRemaining,
      isCorrect: isCorrect,
      userAnswer: userAnswer,
      isSkipped: isSkipped,
    );

    final updatedGame = game.copyWith(
      rounds: [...game.rounds, newRound],
      correctCount: isCorrect ? game.correctCount + 1 : game.correctCount,
      totalScore: game.totalScore + score,
    );

    await _saveGame(updatedGame);
    return updatedGame;
  }

  @override
  Future<Game> finishGame(String gameId) async {
    final game = await getGame(gameId);
    if (game == null) {
      throw Exception('Game not found: $gameId');
    }

    final finishedGame = game.copyWith(
      finishedAt: DateTime.now(),
    );

    await _saveGame(finishedGame);
    return finishedGame;
  }

  @override
  Future<List<Game>> getAllGames() async {
    final gamesData = _localStorage.getGames();
    return gamesData.map((data) => Game.fromJson(data)).toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  @override
  Future<List<Game>> getGamesByPlayer(String playerName) async {
    final allGames = await getAllGames();
    return allGames.where((game) => game.playerName == playerName).toList();
  }

  /// ゲームをローカルストレージに保存
  Future<void> _saveGame(Game game) async {
    final games = _localStorage.getGames();
    final index = games.indexWhere((g) => g['id'] == game.id);

    if (index >= 0) {
      // 既存のゲームを更新
      games[index] = game.toJson();
    } else {
      // 新しいゲームを追加
      games.add(game.toJson());
    }

    await _localStorage.saveGames(games);
  }
}
