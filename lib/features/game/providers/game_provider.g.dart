// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 現在のゲーム状態を管理するプロバイダー

@ProviderFor(CurrentGame)
const currentGameProvider = CurrentGameFamily._();

/// 現在のゲーム状態を管理するプロバイダー
final class CurrentGameProvider
    extends $AsyncNotifierProvider<CurrentGame, Game?> {
  /// 現在のゲーム状態を管理するプロバイダー
  const CurrentGameProvider._({
    required CurrentGameFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'currentGameProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$currentGameHash();

  @override
  String toString() {
    return r'currentGameProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CurrentGame create() => CurrentGame();

  @override
  bool operator ==(Object other) {
    return other is CurrentGameProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$currentGameHash() => r'104b70b9838fa4ab2ed6266a08858358b6c77d47';

/// 現在のゲーム状態を管理するプロバイダー

final class CurrentGameFamily extends $Family
    with
        $ClassFamilyOverride<
          CurrentGame,
          AsyncValue<Game?>,
          Game?,
          FutureOr<Game?>,
          String
        > {
  const CurrentGameFamily._()
    : super(
        retry: null,
        name: r'currentGameProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 現在のゲーム状態を管理するプロバイダー

  CurrentGameProvider call(String gameId) =>
      CurrentGameProvider._(argument: gameId, from: this);

  @override
  String toString() => r'currentGameProvider';
}

/// 現在のゲーム状態を管理するプロバイダー

abstract class _$CurrentGame extends $AsyncNotifier<Game?> {
  late final _$args = ref.$arg as String;
  String get gameId => _$args;

  FutureOr<Game?> build(String gameId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<Game?>, Game?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Game?>, Game?>,
              AsyncValue<Game?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// 現在の問題を取得するプロバイダー

@ProviderFor(currentQuestion)
const currentQuestionProvider = CurrentQuestionFamily._();

/// 現在の問題を取得するプロバイダー

final class CurrentQuestionProvider
    extends
        $FunctionalProvider<
          AsyncValue<Question?>,
          Question?,
          FutureOr<Question?>
        >
    with $FutureModifier<Question?>, $FutureProvider<Question?> {
  /// 現在の問題を取得するプロバイダー
  const CurrentQuestionProvider._({
    required CurrentQuestionFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'currentQuestionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$currentQuestionHash();

  @override
  String toString() {
    return r'currentQuestionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Question?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Question?> create(Ref ref) {
    final argument = this.argument as String;
    return currentQuestion(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CurrentQuestionProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$currentQuestionHash() => r'4d6ef5e838e1536e6ae33d11eb1d3bfefbad091b';

/// 現在の問題を取得するプロバイダー

final class CurrentQuestionFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Question?>, String> {
  const CurrentQuestionFamily._()
    : super(
        retry: null,
        name: r'currentQuestionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 現在の問題を取得するプロバイダー

  CurrentQuestionProvider call(String gameId) =>
      CurrentQuestionProvider._(argument: gameId, from: this);

  @override
  String toString() => r'currentQuestionProvider';
}

/// 現在のラウンド番号を取得するプロバイダー

@ProviderFor(currentRound)
const currentRoundProvider = CurrentRoundFamily._();

/// 現在のラウンド番号を取得するプロバイダー

final class CurrentRoundProvider extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  /// 現在のラウンド番号を取得するプロバイダー
  const CurrentRoundProvider._({
    required CurrentRoundFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'currentRoundProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$currentRoundHash();

  @override
  String toString() {
    return r'currentRoundProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    final argument = this.argument as String;
    return currentRound(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CurrentRoundProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$currentRoundHash() => r'4e8f4cfeb4d9a2e79dfed715c70bc94b3b6080df';

/// 現在のラウンド番号を取得するプロバイダー

final class CurrentRoundFamily extends $Family
    with $FunctionalFamilyOverride<int, String> {
  const CurrentRoundFamily._()
    : super(
        retry: null,
        name: r'currentRoundProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 現在のラウンド番号を取得するプロバイダー

  CurrentRoundProvider call(String gameId) =>
      CurrentRoundProvider._(argument: gameId, from: this);

  @override
  String toString() => r'currentRoundProvider';
}

/// ゲームが終了したかどうかを判定するプロバイダー

@ProviderFor(isGameFinished)
const isGameFinishedProvider = IsGameFinishedFamily._();

/// ゲームが終了したかどうかを判定するプロバイダー

final class IsGameFinishedProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// ゲームが終了したかどうかを判定するプロバイダー
  const IsGameFinishedProvider._({
    required IsGameFinishedFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'isGameFinishedProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$isGameFinishedHash();

  @override
  String toString() {
    return r'isGameFinishedProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    final argument = this.argument as String;
    return isGameFinished(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is IsGameFinishedProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$isGameFinishedHash() => r'9356ab7ce2205ab96e177cde9cd04262ba4f2c48';

/// ゲームが終了したかどうかを判定するプロバイダー

final class IsGameFinishedFamily extends $Family
    with $FunctionalFamilyOverride<bool, String> {
  const IsGameFinishedFamily._()
    : super(
        retry: null,
        name: r'isGameFinishedProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// ゲームが終了したかどうかを判定するプロバイダー

  IsGameFinishedProvider call(String gameId) =>
      IsGameFinishedProvider._(argument: gameId, from: this);

  @override
  String toString() => r'isGameFinishedProvider';
}
