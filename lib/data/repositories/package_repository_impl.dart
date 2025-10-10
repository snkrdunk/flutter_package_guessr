import 'dart:math';
import '../../core/constants/packages_data.dart';
import '../../domain/entities/package.dart';
import '../../domain/entities/question.dart';
import '../../domain/repositories/package_repository.dart';

/// パッケージリポジトリの実装
class PackageRepositoryImpl implements PackageRepository {
  final Random _random = Random();
  List<Package>? _cachedPackages;

  @override
  Future<List<Package>> getAllPackages() async {
    if (_cachedPackages != null) {
      return _cachedPackages!;
    }

    _cachedPackages = PackagesData.samplePackages.map((data) {
      return Package(
        name: data['name'] as String,
        publisher: data['publisher'] as String,
        description: data['description'] as String,
        version: data['version'] as String,
        likes: data['likes'] as int,
        pubPoints: data['pubPoints'] as int,
        popularity: data['popularity'] as int,
        platforms: (data['platforms'] as List<dynamic>).cast<String>(),
        tags: (data['tags'] as List<dynamic>).cast<String>(),
        snippets: (data['snippets'] as List<dynamic>).cast<String>(),
        updatedAt: DateTime.parse(data['updatedAt'] as String),
        logoUrl: data['logoUrl'] as String?,
      );
    }).toList();

    return _cachedPackages!;
  }

  @override
  Future<Package?> getPackage(String name) async {
    final packages = await getAllPackages();
    try {
      return packages.firstWhere((p) => p.name == name);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Question> generateQuestion(List<String> excludedPackages) async {
    final allPackages = await getAllPackages();

    // 除外されていないパッケージをフィルタリング
    final availablePackages = allPackages
        .where((p) => !excludedPackages.contains(p.name))
        .toList();

    if (availablePackages.isEmpty) {
      throw Exception('No available packages for question generation');
    }

    // ランダムに正解パッケージを選択
    final targetPackage = availablePackages[_random.nextInt(availablePackages.length)];

    // 他のパッケージから11個選択して候補を作成（合計12個）
    final otherPackages = availablePackages
        .where((p) => p.name != targetPackage.name)
        .toList()
      ..shuffle(_random);

    final candidatePackages = [
      targetPackage,
      ...otherPackages.take(11),
    ];

    // 候補をシャッフル
    final candidates = candidatePackages.map((p) => p.name).toList()
      ..shuffle(_random);

    // スニペットから最大5個をランダムに選択
    final snippets = List<String>.from(targetPackage.snippets)
      ..shuffle(_random);
    final selectedSnippets = snippets.take(5).toList();

    return Question(
      targetPackage: targetPackage,
      candidates: candidates,
      snippets: selectedSnippets,
    );
  }

  @override
  Future<List<Package>> getRandomPackages(
    int count,
    List<String> excluded,
  ) async {
    final allPackages = await getAllPackages();
    final availablePackages = allPackages
        .where((p) => !excluded.contains(p.name))
        .toList()
      ..shuffle(_random);

    return availablePackages.take(count).toList();
  }
}
