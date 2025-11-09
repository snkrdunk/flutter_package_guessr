import 'package:flutter/material.dart';

/// 回答ボタンのグリッド表示ウィジェット
class AnswerButtons extends StatelessWidget {
  final List<String> candidates;
  final Function(String) onAnswer;
  final bool isEnabled;
  final bool canSkip;

  const AnswerButtons({
    super.key,
    required this.candidates,
    required this.onAnswer,
    this.isEnabled = true,
    this.canSkip = true,
  });

  @override
  Widget build(BuildContext context) {
    // SKIPを除外した候補リストを作成
    final normalCandidates = candidates.where((c) => c != 'SKIP').toList();

    return Column(
      children: [
        // 通常の候補ボタン
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: normalCandidates.map((candidate) {
            return IntrinsicWidth(
              child: _AnswerButton(
                label: candidate,
                onTap: isEnabled ? () => onAnswer(candidate) : null,
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        // スキップボタン（分離して表示）
        _SkipButton(
          onTap: isEnabled && canSkip ? () => onAnswer('SKIP') : null,
          canSkip: canSkip,
        ),
      ],
    );
  }
}

class _AnswerButton extends StatefulWidget {
  final String label;
  final VoidCallback? onTap;

  const _AnswerButton({
    required this.label,
    this.onTap,
  });

  @override
  State<_AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<_AnswerButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isEnabled = widget.onTap != null;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 30,
            constraints: const BoxConstraints(minWidth: 60),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: _isHovered && isEnabled
                  ? Colors.indigo
                  : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: isEnabled ? Colors.grey.shade300 : Colors.grey.shade300,
                width: 1,
              ),
              boxShadow: _isHovered && isEnabled
                  ? [
                      BoxShadow(
                        color: Colors.indigo.withValues(alpha: 0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : null,
            ),
            child: Center(
              child: Text(
                widget.label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: _isHovered && isEnabled
                      ? Colors.white
                      : (isEnabled ? Colors.grey.shade800 : Colors.grey.shade400),
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SkipButton extends StatelessWidget {
  final VoidCallback? onTap;
  final bool canSkip;

  const _SkipButton({
    required this.onTap,
    required this.canSkip,
  });

  @override
  Widget build(BuildContext context) {
    final isEnabled = onTap != null;

    return OutlinedButton.icon(
      onPressed: onTap,
      icon: Icon(
        Icons.skip_next,
        size: 18,
        color: isEnabled ? Colors.orange : Colors.grey,
      ),
      label: Text(
        canSkip ? 'スキップ' : 'スキップ不可（連続使用不可）',
        style: TextStyle(
          color: isEnabled ? Colors.orange : Colors.grey,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        side: BorderSide(
          color: isEnabled ? Colors.orange : Colors.grey.shade300,
          width: 2,
        ),
        backgroundColor: isEnabled
            ? Colors.orange.withValues(alpha: 0.1)
            : Colors.grey.shade100,
      ),
    );
  }
}
