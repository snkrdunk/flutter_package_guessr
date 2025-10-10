import 'package:freezed_annotation/freezed_annotation.dart';

part 'game.freezed.dart';
part 'game.g.dart';

@freezed
abstract class Game with _$Game {
  const factory Game({
    required String id,
    required String playerName,
    required int totalRounds,
    required List<Round> rounds,
    required int correctCount,
    required int totalScore,
    required DateTime createdAt,
    DateTime? finishedAt,
  }) = _Game;

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
}

@freezed
abstract class Round with _$Round {
  const factory Round({
    required String packageName,
    required int timeRemaining,
    required bool isCorrect,
    String? userAnswer,
  }) = _Round;

  factory Round.fromJson(Map<String, dynamic> json) => _$RoundFromJson(json);
}
