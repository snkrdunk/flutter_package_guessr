import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/repositories/package_repository.dart';
import 'package_repository_impl.dart';

part 'package_repository_provider.g.dart';

/// PackageRepositoryのプロバイダー
@riverpod
PackageRepository packageRepository(Ref ref) {
  return PackageRepositoryImpl();
}
