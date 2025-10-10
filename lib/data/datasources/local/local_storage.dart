import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

/// ローカルストレージを管理するクラス
class LocalStorage {
  static const String _keyPrefix = 'flutter_package_guesser_';
  static const String _gamesKey = '${_keyPrefix}games';
  static const String _lastPlayerNameKey = '${_keyPrefix}last_player_name';

  final SharedPreferences _prefs;

  LocalStorage(this._prefs);

  /// ゲーム履歴を保存
  Future<void> saveGames(List<Map<String, dynamic>> games) async {
    final jsonString = jsonEncode(games);
    await _prefs.setString(_gamesKey, jsonString);
  }

  /// ゲーム履歴を取得
  List<Map<String, dynamic>> getGames() {
    final jsonString = _prefs.getString(_gamesKey);
    if (jsonString == null) return [];

    final List<dynamic> decoded = jsonDecode(jsonString);
    return decoded.cast<Map<String, dynamic>>();
  }

  /// 最後に使用したプレイヤー名を保存
  Future<void> saveLastPlayerName(String name) async {
    await _prefs.setString(_lastPlayerNameKey, name);
  }

  /// 最後に使用したプレイヤー名を取得
  String? getLastPlayerName() {
    return _prefs.getString(_lastPlayerNameKey);
  }

  /// 全データをクリア
  Future<void> clear() async {
    await _prefs.remove(_gamesKey);
    await _prefs.remove(_lastPlayerNameKey);
  }
}
