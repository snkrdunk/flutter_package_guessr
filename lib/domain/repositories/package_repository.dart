import '../entities/package.dart';
import '../entities/question.dart';

/// パッケージリポジトリのインターフェース
abstract class PackageRepository {
  /// 全てのパッケージを取得
  Future<List<Package>> getAllPackages();

  /// パッケージ名でパッケージを取得
  Future<Package?> getPackage(String name);

  /// ランダムに問題を生成
  /// [excludedPackages] 既に出題済みのパッケージ名リスト
  Future<Question> generateQuestion(List<String> excludedPackages);

  /// ランダムにN個のパッケージを選択
  Future<List<Package>> getRandomPackages(int count, List<String> excluded);
}
