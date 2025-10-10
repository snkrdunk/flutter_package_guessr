// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// ゲーム開始を管理するプロバイダー

@ProviderFor(GameStarter)
const gameStarterProvider = GameStarterProvider._();

/// ゲーム開始を管理するプロバイダー
final class GameStarterProvider
    extends $AsyncNotifierProvider<GameStarter, Game?> {
  /// ゲーム開始を管理するプロバイダー
  const GameStarterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gameStarterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gameStarterHash();

  @$internal
  @override
  GameStarter create() => GameStarter();
}

String _$gameStarterHash() => r'dcf5cb598a5fe8363a9c654bf7a347b4a0dffe99';

/// ゲーム開始を管理するプロバイダー

abstract class _$GameStarter extends $AsyncNotifier<Game?> {
  FutureOr<Game?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
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

/// 最後に使用したプレイヤー名を取得するプロバイダー

@ProviderFor(lastPlayerName)
const lastPlayerNameProvider = LastPlayerNameProvider._();

/// 最後に使用したプレイヤー名を取得するプロバイダー

final class LastPlayerNameProvider
    extends $FunctionalProvider<AsyncValue<String?>, String?, FutureOr<String?>>
    with $FutureModifier<String?>, $FutureProvider<String?> {
  /// 最後に使用したプレイヤー名を取得するプロバイダー
  const LastPlayerNameProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lastPlayerNameProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lastPlayerNameHash();

  @$internal
  @override
  $FutureProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String?> create(Ref ref) {
    return lastPlayerName(ref);
  }
}

String _$lastPlayerNameHash() => r'85ffc962d8c97fa0ea2f2052724199105c39b3dc';
