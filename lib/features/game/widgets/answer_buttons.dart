import 'package:flutter/material.dart';

/// 回答ボタンのグリッド表示ウィジェット
class AnswerButtons extends StatelessWidget {
  final List<String> candidates;
  final Function(String) onAnswer;
  final bool isEnabled;
  final bool canSkip;
  final String? selectedAnswer;
  final String? correctAnswer;

  const AnswerButtons({
    super.key,
    required this.candidates,
    required this.onAnswer,
    this.isEnabled = true,
    this.canSkip = true,
    this.selectedAnswer,
    this.correctAnswer,
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
            final isSelected = selectedAnswer == candidate;
            final isCorrectChoice = correctAnswer == candidate;
            final showFeedback = selectedAnswer != null && correctAnswer != null;

            return IntrinsicWidth(
              child: _AnswerButton(
                label: candidate,
                onTap: isEnabled ? () => onAnswer(candidate) : null,
                isSelected: isSelected,
                isCorrect: isCorrectChoice,
                showFeedback: showFeedback,
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
  final bool isSelected;
  final bool isCorrect;
  final bool showFeedback;

  const _AnswerButton({
    required this.label,
    this.onTap,
    this.isSelected = false,
    this.isCorrect = false,
    this.showFeedback = false,
  });

  @override
  State<_AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<_AnswerButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isEnabled = widget.onTap != null;

    // フィードバック表示時の色とアイコンを決定
    Color? feedbackColor;
    IconData? feedbackIcon;
    Color? feedbackTextColor;

    if (widget.showFeedback) {
      if (widget.isSelected && widget.isCorrect) {
        // 選択した回答が正解
        feedbackColor = Colors.green;
        feedbackIcon = Icons.check_circle;
        feedbackTextColor = Colors.white;
      } else if (widget.isSelected && !widget.isCorrect) {
        // 選択した回答が不正解
        feedbackColor = Colors.red;
        feedbackIcon = Icons.cancel;
        feedbackTextColor = Colors.white;
      } else if (!widget.isSelected && widget.isCorrect) {
        // 正解の選択肢（ユーザーが選ばなかった）
        feedbackColor = Colors.green.shade100;
        feedbackIcon = Icons.check_circle_outline;
        feedbackTextColor = Colors.green.shade800;
      }
    }

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
              color: feedbackColor ??
                  (_isHovered && isEnabled
                      ? Colors.indigo
                      : Colors.grey.shade200),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: feedbackColor ??
                    (isEnabled ? Colors.grey.shade300 : Colors.grey.shade300),
                width: feedbackColor != null ? 2 : 1,
              ),
              boxShadow: feedbackColor != null
                  ? [
                      BoxShadow(
                        color: feedbackColor.withValues(alpha: 0.4),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : (_isHovered && isEnabled
                      ? [
                          BoxShadow(
                            color: Colors.indigo.withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : null),
            ),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (feedbackIcon != null) ...[
                    Icon(
                      feedbackIcon,
                      size: 16,
                      color: feedbackTextColor,
                    ),
                    const SizedBox(width: 6),
                  ],
                  Flexible(
                    child: Text(
                      widget.label,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: feedbackTextColor ??
                            (_isHovered && isEnabled
                                ? Colors.white
                                : (isEnabled
                                    ? Colors.grey.shade800
                                    : Colors.grey.shade400)),
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
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
        canSkip ? 'Skip' : 'Skip Unavailable (Cannot use consecutively)',
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
