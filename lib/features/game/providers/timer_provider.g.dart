// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// タイマーの秒数を管理するプロバイダー

@ProviderFor(GameTimer)
const gameTimerProvider = GameTimerProvider._();

/// タイマーの秒数を管理するプロバイダー
final class GameTimerProvider extends $NotifierProvider<GameTimer, int> {
  /// タイマーの秒数を管理するプロバイダー
  const GameTimerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gameTimerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gameTimerHash();

  @$internal
  @override
  GameTimer create() => GameTimer();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$gameTimerHash() => r'62cc4e3ea86a31e88723f42c6b85b7f4a796df55';

/// タイマーの秒数を管理するプロバイダー

abstract class _$GameTimer extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// タイマーが警告状態かどうかを判定するプロバイダー

@ProviderFor(isTimerWarning)
const isTimerWarningProvider = IsTimerWarningProvider._();

/// タイマーが警告状態かどうかを判定するプロバイダー

final class IsTimerWarningProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// タイマーが警告状態かどうかを判定するプロバイダー
  const IsTimerWarningProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isTimerWarningProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isTimerWarningHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isTimerWarning(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isTimerWarningHash() => r'c9782165c6a1c2af4d605c056fded014027e5d59';

/// タイマーが終了したかどうかを判定するプロバイダー

@ProviderFor(isTimerFinished)
const isTimerFinishedProvider = IsTimerFinishedProvider._();

/// タイマーが終了したかどうかを判定するプロバイダー

final class IsTimerFinishedProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// タイマーが終了したかどうかを判定するプロバイダー
  const IsTimerFinishedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isTimerFinishedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isTimerFinishedHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isTimerFinished(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isTimerFinishedHash() => r'26ab0b21e1cb8abd9816e32b9f09b5c095d062ef';
