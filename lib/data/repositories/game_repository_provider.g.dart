// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// GameRepositoryのプロバイダー

@ProviderFor(gameRepository)
const gameRepositoryProvider = GameRepositoryProvider._();

/// GameRepositoryのプロバイダー

final class GameRepositoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<GameRepository>,
          GameRepository,
          FutureOr<GameRepository>
        >
    with $FutureModifier<GameRepository>, $FutureProvider<GameRepository> {
  /// GameRepositoryのプロバイダー
  const GameRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gameRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gameRepositoryHash();

  @$internal
  @override
  $FutureProviderElement<GameRepository> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<GameRepository> create(Ref ref) {
    return gameRepository(ref);
  }
}

String _$gameRepositoryHash() => r'615cca4b1145e7d7ea07491f8caa5316b2f4dffb';
