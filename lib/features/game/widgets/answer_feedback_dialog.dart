import 'package:flutter/material.dart';

import '../../../domain/entities/package.dart';

/// 回答後の正解/不正解フィードバックを表示するダイアログ
class AnswerFeedbackDialog extends StatefulWidget {
  final bool isCorrect;
  final Package targetPackage;

  const AnswerFeedbackDialog({
    super.key,
    required this.isCorrect,
    required this.targetPackage,
  });

  @override
  State<AnswerFeedbackDialog> createState() => _AnswerFeedbackDialogState();
}

class _AnswerFeedbackDialogState extends State<AnswerFeedbackDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    // スケールアニメーション: 0.8 -> 1.0
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );

    // フェードアニメーション: 0.0 -> 1.0
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    // アニメーション開始
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: _FeedbackContent(
            isCorrect: widget.isCorrect,
            targetPackage: widget.targetPackage,
          ),
        ),
      ),
    );
  }
}

class _FeedbackContent extends StatelessWidget {
  final bool isCorrect;
  final Package targetPackage;

  const _FeedbackContent({
    required this.isCorrect,
    required this.targetPackage,
  });

  @override
  Widget build(BuildContext context) {
    final title = isCorrect ? 'Correct!🎉' : 'Oops!😢';
    final titleColor = isCorrect ? Colors.green : Colors.red;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // タイトル
              Text(
                title,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: titleColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              // リポジトリ名（太字で大きく）
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey.shade800,
                  ),
                  children: [
                    const TextSpan(text: 'The repository is '),
                    TextSpan(
                      text: '[${targetPackage.name}]',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // 説明文
              Text(
                targetPackage.description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // Next Roundボタン
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Next Round',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
