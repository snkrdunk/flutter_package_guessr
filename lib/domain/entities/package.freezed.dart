// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'package.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Package {

 String get name; String get publisher; String get description; String get version; int get likes; int get pubPoints; int get popularity; List<String> get platforms; List<String> get tags; List<String> get snippets; DateTime get updatedAt; String? get logoUrl;
/// Create a copy of Package
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PackageCopyWith<Package> get copyWith => _$PackageCopyWithImpl<Package>(this as Package, _$identity);

  /// Serializes this Package to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Package&&(identical(other.name, name) || other.name == name)&&(identical(other.publisher, publisher) || other.publisher == publisher)&&(identical(other.description, description) || other.description == description)&&(identical(other.version, version) || other.version == version)&&(identical(other.likes, likes) || other.likes == likes)&&(identical(other.pubPoints, pubPoints) || other.pubPoints == pubPoints)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&const DeepCollectionEquality().equals(other.platforms, platforms)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.snippets, snippets)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,publisher,description,version,likes,pubPoints,popularity,const DeepCollectionEquality().hash(platforms),const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(snippets),updatedAt,logoUrl);

@override
String toString() {
  return 'Package(name: $name, publisher: $publisher, description: $description, version: $version, likes: $likes, pubPoints: $pubPoints, popularity: $popularity, platforms: $platforms, tags: $tags, snippets: $snippets, updatedAt: $updatedAt, logoUrl: $logoUrl)';
}


}

/// @nodoc
abstract mixin class $PackageCopyWith<$Res>  {
  factory $PackageCopyWith(Package value, $Res Function(Package) _then) = _$PackageCopyWithImpl;
@useResult
$Res call({
 String name, String publisher, String description, String version, int likes, int pubPoints, int popularity, List<String> platforms, List<String> tags, List<String> snippets, DateTime updatedAt, String? logoUrl
});




}
/// @nodoc
class _$PackageCopyWithImpl<$Res>
    implements $PackageCopyWith<$Res> {
  _$PackageCopyWithImpl(this._self, this._then);

  final Package _self;
  final $Res Function(Package) _then;

/// Create a copy of Package
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? publisher = null,Object? description = null,Object? version = null,Object? likes = null,Object? pubPoints = null,Object? popularity = null,Object? platforms = null,Object? tags = null,Object? snippets = null,Object? updatedAt = null,Object? logoUrl = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,publisher: null == publisher ? _self.publisher : publisher // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,likes: null == likes ? _self.likes : likes // ignore: cast_nullable_to_non_nullable
as int,pubPoints: null == pubPoints ? _self.pubPoints : pubPoints // ignore: cast_nullable_to_non_nullable
as int,popularity: null == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as int,platforms: null == platforms ? _self.platforms : platforms // ignore: cast_nullable_to_non_nullable
as List<String>,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,snippets: null == snippets ? _self.snippets : snippets // ignore: cast_nullable_to_non_nullable
as List<String>,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Package].
extension PackagePatterns on Package {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Package value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Package() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Package value)  $default,){
final _that = this;
switch (_that) {
case _Package():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Package value)?  $default,){
final _that = this;
switch (_that) {
case _Package() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String publisher,  String description,  String version,  int likes,  int pubPoints,  int popularity,  List<String> platforms,  List<String> tags,  List<String> snippets,  DateTime updatedAt,  String? logoUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Package() when $default != null:
return $default(_that.name,_that.publisher,_that.description,_that.version,_that.likes,_that.pubPoints,_that.popularity,_that.platforms,_that.tags,_that.snippets,_that.updatedAt,_that.logoUrl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String publisher,  String description,  String version,  int likes,  int pubPoints,  int popularity,  List<String> platforms,  List<String> tags,  List<String> snippets,  DateTime updatedAt,  String? logoUrl)  $default,) {final _that = this;
switch (_that) {
case _Package():
return $default(_that.name,_that.publisher,_that.description,_that.version,_that.likes,_that.pubPoints,_that.popularity,_that.platforms,_that.tags,_that.snippets,_that.updatedAt,_that.logoUrl);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String publisher,  String description,  String version,  int likes,  int pubPoints,  int popularity,  List<String> platforms,  List<String> tags,  List<String> snippets,  DateTime updatedAt,  String? logoUrl)?  $default,) {final _that = this;
switch (_that) {
case _Package() when $default != null:
return $default(_that.name,_that.publisher,_that.description,_that.version,_that.likes,_that.pubPoints,_that.popularity,_that.platforms,_that.tags,_that.snippets,_that.updatedAt,_that.logoUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Package implements Package {
  const _Package({required this.name, required this.publisher, required this.description, required this.version, required this.likes, required this.pubPoints, required this.popularity, required final  List<String> platforms, required final  List<String> tags, required final  List<String> snippets, required this.updatedAt, this.logoUrl}): _platforms = platforms,_tags = tags,_snippets = snippets;
  factory _Package.fromJson(Map<String, dynamic> json) => _$PackageFromJson(json);

@override final  String name;
@override final  String publisher;
@override final  String description;
@override final  String version;
@override final  int likes;
@override final  int pubPoints;
@override final  int popularity;
 final  List<String> _platforms;
@override List<String> get platforms {
  if (_platforms is EqualUnmodifiableListView) return _platforms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_platforms);
}

 final  List<String> _tags;
@override List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

 final  List<String> _snippets;
@override List<String> get snippets {
  if (_snippets is EqualUnmodifiableListView) return _snippets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_snippets);
}

@override final  DateTime updatedAt;
@override final  String? logoUrl;

/// Create a copy of Package
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PackageCopyWith<_Package> get copyWith => __$PackageCopyWithImpl<_Package>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PackageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Package&&(identical(other.name, name) || other.name == name)&&(identical(other.publisher, publisher) || other.publisher == publisher)&&(identical(other.description, description) || other.description == description)&&(identical(other.version, version) || other.version == version)&&(identical(other.likes, likes) || other.likes == likes)&&(identical(other.pubPoints, pubPoints) || other.pubPoints == pubPoints)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&const DeepCollectionEquality().equals(other._platforms, _platforms)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._snippets, _snippets)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,publisher,description,version,likes,pubPoints,popularity,const DeepCollectionEquality().hash(_platforms),const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_snippets),updatedAt,logoUrl);

@override
String toString() {
  return 'Package(name: $name, publisher: $publisher, description: $description, version: $version, likes: $likes, pubPoints: $pubPoints, popularity: $popularity, platforms: $platforms, tags: $tags, snippets: $snippets, updatedAt: $updatedAt, logoUrl: $logoUrl)';
}


}

/// @nodoc
abstract mixin class _$PackageCopyWith<$Res> implements $PackageCopyWith<$Res> {
  factory _$PackageCopyWith(_Package value, $Res Function(_Package) _then) = __$PackageCopyWithImpl;
@override @useResult
$Res call({
 String name, String publisher, String description, String version, int likes, int pubPoints, int popularity, List<String> platforms, List<String> tags, List<String> snippets, DateTime updatedAt, String? logoUrl
});




}
/// @nodoc
class __$PackageCopyWithImpl<$Res>
    implements _$PackageCopyWith<$Res> {
  __$PackageCopyWithImpl(this._self, this._then);

  final _Package _self;
  final $Res Function(_Package) _then;

/// Create a copy of Package
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? publisher = null,Object? description = null,Object? version = null,Object? likes = null,Object? pubPoints = null,Object? popularity = null,Object? platforms = null,Object? tags = null,Object? snippets = null,Object? updatedAt = null,Object? logoUrl = freezed,}) {
  return _then(_Package(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,publisher: null == publisher ? _self.publisher : publisher // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,likes: null == likes ? _self.likes : likes // ignore: cast_nullable_to_non_nullable
as int,pubPoints: null == pubPoints ? _self.pubPoints : pubPoints // ignore: cast_nullable_to_non_nullable
as int,popularity: null == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as int,platforms: null == platforms ? _self._platforms : platforms // ignore: cast_nullable_to_non_nullable
as List<String>,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,snippets: null == snippets ? _self._snippets : snippets // ignore: cast_nullable_to_non_nullable
as List<String>,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
