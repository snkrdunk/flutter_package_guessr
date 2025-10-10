// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Package _$PackageFromJson(Map<String, dynamic> json) => _Package(
  name: json['name'] as String,
  publisher: json['publisher'] as String,
  description: json['description'] as String,
  version: json['version'] as String,
  likes: (json['likes'] as num).toInt(),
  pubPoints: (json['pubPoints'] as num).toInt(),
  popularity: (json['popularity'] as num).toInt(),
  platforms: (json['platforms'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  snippets: (json['snippets'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  logoUrl: json['logoUrl'] as String?,
);

Map<String, dynamic> _$PackageToJson(_Package instance) => <String, dynamic>{
  'name': instance.name,
  'publisher': instance.publisher,
  'description': instance.description,
  'version': instance.version,
  'likes': instance.likes,
  'pubPoints': instance.pubPoints,
  'popularity': instance.popularity,
  'platforms': instance.platforms,
  'tags': instance.tags,
  'snippets': instance.snippets,
  'updatedAt': instance.updatedAt.toIso8601String(),
  'logoUrl': instance.logoUrl,
};
