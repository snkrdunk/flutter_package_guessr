import 'package:flutter/material.dart';
import '../../../domain/entities/game.dart';

/// ラウンド詳細リスト
class RoundDetailsList extends StatelessWidget {
  final List<Round> rounds;

  const RoundDetailsList({
    super.key,
    required this.rounds,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Round Details',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const Divider(height: 1),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: rounds.length,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final round = rounds[index];
              return _RoundItem(
                roundNumber: index + 1,
                round: round,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _RoundItem extends StatelessWidget {
  final int roundNumber;
  final Round round;

  const _RoundItem({
    required this.roundNumber,
    required this.round,
  });

  @override
  Widget build(BuildContext context) {
    // スキップの場合の特別処理
    if (round.isSkipped) {
      return ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: Colors.orange.shade300,
          child: Text(
            '$roundNumber',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          round.packageName,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              'Skipped',
              style: TextStyle(
                color: Colors.orange.shade700,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'Time remaining: ${round.timeRemaining}s',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 13,
              ),
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(
              Icons.skip_next,
              color: Colors.orange,
              size: 28,
            ),
            const SizedBox(height: 4),
            Text(
              'SKIP',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.orange,
                fontSize: 14,
              ),
            ),
          ],
        ),
      );
    }

    // 通常の正解/不正解の処理
    final score = round.isCorrect ? 100 + round.timeRemaining : 0;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: CircleAvatar(
        backgroundColor: round.isCorrect ? Colors.green : Colors.red,
        child: Text(
          '$roundNumber',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Text(
        round.packageName,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          if (round.userAnswer != null && round.userAnswer!.isNotEmpty)
            Text(
              'Answer: ${round.userAnswer}',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 13,
              ),
            )
          else
            Text(
              'Answer: Time Up',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 13,
              ),
            ),
          const SizedBox(height: 2),
          Text(
            'Time remaining: ${round.timeRemaining}s',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 13,
            ),
          ),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(
            round.isCorrect ? Icons.check_circle : Icons.cancel,
            color: round.isCorrect ? Colors.green : Colors.red,
            size: 28,
          ),
          const SizedBox(height: 4),
          Text(
            '+$score',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: round.isCorrect ? Colors.green : Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
