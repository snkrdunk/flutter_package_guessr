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
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 2.5,
      ),
      itemCount: candidates.length,
      itemBuilder: (context, index) {
        final candidate = candidates[index];
        return _AnswerButton(
          label: candidate,
          onTap: isEnabled ? () => onAnswer(candidate) : null,
        );
      },
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
          borderRadius: BorderRadius.circular(12),
          child: Container(
            decoration: BoxDecoration(
              color: _isHovered && isEnabled
                  ? Colors.indigo
                  : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isEnabled ? Colors.indigo : Colors.grey.shade300,
                width: 2,
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: Text(
                  widget.label,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: _isHovered && isEnabled
                        ? Colors.white
                        : (isEnabled ? Colors.indigo : Colors.grey.shade400),
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
