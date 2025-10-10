// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Question _$QuestionFromJson(Map<String, dynamic> json) => _Question(
  targetPackage: Package.fromJson(
    json['targetPackage'] as Map<String, dynamic>,
  ),
  candidates: (json['candidates'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  snippets: (json['snippets'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$QuestionToJson(_Question instance) => <String, dynamic>{
  'targetPackage': instance.targetPackage,
  'candidates': instance.candidates,
  'snippets': instance.snippets,
};
