import 'package:freezed_annotation/freezed_annotation.dart';

part 'package.freezed.dart';
part 'package.g.dart';

@freezed
abstract class Package with _$Package {
  const factory Package({
    required String name,
    required String publisher,
    required String description,
    required String version,
    required int likes,
    required int pubPoints,
    required int popularity,
    required List<String> platforms,
    required List<String> tags,
    required List<String> snippets,
    required DateTime updatedAt,
    String? logoUrl,
  }) = _Package;

  factory Package.fromJson(Map<String, dynamic> json) =>
      _$PackageFromJson(json);
}
