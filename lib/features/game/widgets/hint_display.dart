import 'package:flutter/material.dart';
import '../../../domain/entities/package.dart';

/// ヒント表示ウィジェット
class HintDisplay extends StatelessWidget {
  final Package package;
  final int secondsRemaining;

  const HintDisplay({
    super.key,
    required this.package,
    required this.secondsRemaining,
  });

  @override
  Widget build(BuildContext context) {
    final hints = _getHints();

    if (hints.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        const Divider(),
        const SizedBox(height: 8),
        Text(
          'ヒント',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: hints.map((hint) => _HintChip(hint: hint)).toList(),
        ),
      ],
    );
  }

  List<HintInfo> _getHints() {
    final hints = <HintInfo>[];

    // 45秒以下: プラットフォーム情報
    if (secondsRemaining <= 45 && package.platforms.isNotEmpty) {
      hints.add(HintInfo(
        icon: Icons.devices,
        label: 'Platform: ${package.platforms.join(", ")}',
      ));
    }

    // 30秒以下: タグ情報
    if (secondsRemaining <= 30 && package.tags.isNotEmpty) {
      hints.add(HintInfo(
        icon: Icons.label,
        label: 'Tags: ${package.tags.take(2).join(", ")}',
      ));
    }

    // 15秒以下: Pub Points
    if (secondsRemaining <= 15) {
      hints.add(HintInfo(
        icon: Icons.star,
        label: 'Pub Points: ${package.pubPoints}',
      ));
    }

    // 5秒以下: いいね数
    if (secondsRemaining <= 5) {
      hints.add(HintInfo(
        icon: Icons.favorite,
        label: 'Likes: ${package.likes}',
      ));
    }

    return hints;
  }
}

class HintInfo {
  final IconData icon;
  final String label;

  HintInfo({required this.icon, required this.label});
}

class _HintChip extends StatelessWidget {
  final HintInfo hint;

  const _HintChip({required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.amber.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.amber.shade300,
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            hint.icon,
            size: 18,
            color: Colors.amber.shade700,
          ),
          const SizedBox(width: 6),
          Text(
            hint.label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.amber.shade900,
            ),
          ),
        ],
      ),
    );
  }
}
