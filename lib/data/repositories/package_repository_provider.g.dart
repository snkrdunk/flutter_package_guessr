// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// PackageRepositoryのプロバイダー

@ProviderFor(packageRepository)
const packageRepositoryProvider = PackageRepositoryProvider._();

/// PackageRepositoryのプロバイダー

final class PackageRepositoryProvider
    extends
        $FunctionalProvider<
          PackageRepository,
          PackageRepository,
          PackageRepository
        >
    with $Provider<PackageRepository> {
  /// PackageRepositoryのプロバイダー
  const PackageRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'packageRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$packageRepositoryHash();

  @$internal
  @override
  $ProviderElement<PackageRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PackageRepository create(Ref ref) {
    return packageRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PackageRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PackageRepository>(value),
    );
  }
}

String _$packageRepositoryHash() => r'e874254d696de530b3b9f92405c8654068627150';
