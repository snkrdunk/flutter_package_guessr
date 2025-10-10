import 'package:flutter/material.dart';
import '../../../domain/entities/game.dart';

/// スコアサマリーカード
class ScoreSummaryCard extends StatelessWidget {
  final Game game;

  const ScoreSummaryCard({
    super.key,
    required this.game,
  });

  @override
  Widget build(BuildContext context) {
    final accuracy = game.totalRounds > 0
        ? (game.correctCount / game.totalRounds * 100).toStringAsFixed(1)
        : '0.0';

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // トロフィーアイコン
            Icon(
              Icons.emoji_events,
              size: 80,
              color: _getTrophyColor(game.correctCount, game.totalRounds),
            ),
            const SizedBox(height: 16),

            // プレイヤー名
            Text(
              game.playerName,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 24),

            // スコア表示
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.indigo.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Text(
                    '総スコア',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${game.totalScore}',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // 統計情報
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _StatItem(
                  icon: Icons.check_circle,
                  label: '正解数',
                  value: '${game.correctCount}/${game.totalRounds}',
                  color: Colors.green,
                ),
                _StatItem(
                  icon: Icons.percent,
                  label: '正解率',
                  value: '$accuracy%',
                  color: Colors.blue,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getTrophyColor(int correct, int total) {
    final rate = correct / total;
    if (rate >= 0.8) return Colors.amber;
    if (rate >= 0.6) return Colors.grey;
    return Colors.brown;
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color, size: 32),
        const SizedBox(height: 8),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey[600],
              ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
        ),
      ],
    );
  }
}
