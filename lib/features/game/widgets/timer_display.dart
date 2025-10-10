import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/timer_provider.dart';

/// タイマー表示ウィジェット
class TimerDisplay extends ConsumerWidget {
  const TimerDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seconds = ref.watch(gameTimerProvider);
    final isWarning = ref.watch(isTimerWarningProvider);
    final isFinished = ref.watch(isTimerFinishedProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: isWarning
            ? Colors.red.withOpacity(0.1)
            : Colors.indigo.withOpacity(0.1),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isWarning ? Colors.red : Colors.indigo,
          width: 2,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isFinished
                ? Icons.timer_off
                : Icons.timer,
            color: isWarning ? Colors.red : Colors.indigo,
            size: 28,
          ),
          const SizedBox(width: 12),
          Text(
            '${seconds}秒',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: isWarning ? Colors.red : Colors.indigo,
            ),
          ),
        ],
      ),
    );
  }
}
