import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'timer_provider.g.dart';

/// タイマーの秒数を管理するプロバイダー
@riverpod
class GameTimer extends _$GameTimer {
  Timer? _timer;
  static const int initialSeconds = 60;

  @override
  int build() => initialSeconds;

  /// タイマーを開始
  void start() {
    _timer?.cancel();
    state = initialSeconds;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state > 0) {
        state = state - 1;
      } else {
        timer.cancel();
        // タイムアップ時の処理は呼び出し側で実装
      }
    });
  }

  /// タイマーを停止
  void stop() {
    _timer?.cancel();
  }

  /// タイマーをリセット
  void reset() {
    _timer?.cancel();
    state = initialSeconds;
  }
}

/// タイマーが警告状態かどうかを判定するプロバイダー
@riverpod
bool isTimerWarning(Ref ref) {
  final seconds = ref.watch(gameTimerProvider);
  return seconds <= 10;
}

/// タイマーが終了したかどうかを判定するプロバイダー
@riverpod
bool isTimerFinished(Ref ref) {
  final seconds = ref.watch(gameTimerProvider);
  return seconds == 0;
}
