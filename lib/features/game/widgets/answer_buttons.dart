import 'package:flutter/material.dart';

/// 回答ボタンのグリッド表示ウィジェット
class AnswerButtons extends StatelessWidget {
  final List<String> candidates;
  final Function(String) onAnswer;
  final bool isEnabled;

  const AnswerButtons({
    super.key,
    required this.candidates,
    required this.onAnswer,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: candidates.map((candidate) {
        return IntrinsicWidth(
          child: _AnswerButton(
            label: candidate,
            onTap: isEnabled ? () => onAnswer(candidate) : null,
          ),
        );
      }).toList(),
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
