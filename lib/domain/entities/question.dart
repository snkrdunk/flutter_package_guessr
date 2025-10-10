import 'package:freezed_annotation/freezed_annotation.dart';
import 'package.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
abstract class Question with _$Question {
  const factory Question({
    required Package targetPackage,
    required List<String> candidates,
    required List<String> snippets,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}
