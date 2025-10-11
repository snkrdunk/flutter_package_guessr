// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Game _$GameFromJson(Map<String, dynamic> json) => _Game(
  id: json['id'] as String,
  playerName: json['playerName'] as String,
  totalRounds: (json['totalRounds'] as num).toInt(),
  rounds: (json['rounds'] as List<dynamic>)
      .map((e) => Round.fromJson(e as Map<String, dynamic>))
      .toList(),
  correctCount: (json['correctCount'] as num).toInt(),
  totalScore: (json['totalScore'] as num).toInt(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  finishedAt: json['finishedAt'] == null
      ? null
      : DateTime.parse(json['finishedAt'] as String),
);

Map<String, dynamic> _$GameToJson(_Game instance) => <String, dynamic>{
  'id': instance.id,
  'playerName': instance.playerName,
  'totalRounds': instance.totalRounds,
  'rounds': instance.rounds,
  'correctCount': instance.correctCount,
  'totalScore': instance.totalScore,
  'createdAt': instance.createdAt.toIso8601String(),
  'finishedAt': instance.finishedAt?.toIso8601String(),
};

_Round _$RoundFromJson(Map<String, dynamic> json) => _Round(
  packageName: json['packageName'] as String,
  timeRemaining: (json['timeRemaining'] as num).toInt(),
  isCorrect: json['isCorrect'] as bool,
  userAnswer: json['userAnswer'] as String?,
  isSkipped: json['isSkipped'] as bool? ?? false,
);

Map<String, dynamic> _$RoundToJson(_Round instance) => <String, dynamic>{
  'packageName': instance.packageName,
  'timeRemaining': instance.timeRemaining,
  'isCorrect': instance.isCorrect,
  'userAnswer': instance.userAnswer,
  'isSkipped': instance.isSkipped,
};
