import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/game_provider.dart';
import '../providers/timer_provider.dart';
import '../widgets/answer_buttons.dart';
import '../widgets/answer_feedback_dialog.dart';
import '../widgets/code_snippet_viewer.dart';
import '../widgets/hint_display.dart';
import '../widgets/timer_display.dart';

class GameScreen extends ConsumerStatefulWidget {
  final String gameId;

  const GameScreen({super.key, required this.gameId});

  @override
  ConsumerState<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen> {
  String? _currentQuestionPackageName;
  bool _isProcessingAnswer = false;
  String? _selectedAnswer;
  bool _showingFeedback = false;

  @override
  void initState() {
    super.initState();
    // タイマーを開始
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(gameTimerProvider.notifier).start();
    });
  }

  @override
  void dispose() {
    // disposeではrefを使わない
    super.dispose();
  }

  Future<void> _handleAnswer(String answer) async {
    if (_currentQuestionPackageName == null || _isProcessingAnswer) return;

    // 現在の問題データを取得
    final questionAsync = ref.read(currentQuestionProvider(widget.gameId));
    final question = questionAsync.value;
    if (question == null) return;

    setState(() {
      _isProcessingAnswer = true;
      _selectedAnswer = answer;
      _showingFeedback = true;
    });

    // タイマーを停止
    ref.read(gameTimerProvider.notifier).stop();

    final timeRemaining = ref.read(gameTimerProvider);
    final isSkipped = answer == 'SKIP';
    final isCorrect = !isSkipped && answer == _currentQuestionPackageName;

    // スキップ時以外はフィードバックを表示
    if (!isSkipped) {
      // ボタンのフィードバックを少し表示
      await Future.delayed(const Duration(milliseconds: 300));

      if (!mounted) return;

      // フィードバックダイアログを表示（Next Roundボタンで閉じる）
      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AnswerFeedbackDialog(
          isCorrect: isCorrect,
          targetPackage: question.targetPackage,
        ),
      );

      if (!mounted) return;
    }

    // 回答を送信して更新されたゲームデータを取得
    final updatedGame = await ref
        .read(currentGameProvider(widget.gameId).notifier)
        .submitAnswer(answer, timeRemaining, _currentQuestionPackageName!);

    if (!mounted || updatedGame == null) {
      if (mounted) {
        setState(() {
          _isProcessingAnswer = false;
          _showingFeedback = false;
          _selectedAnswer = null;
        });
      }
      return;
    }

    // 更新されたゲームデータから直接終了判定
    final isFinished = updatedGame.rounds.length >= updatedGame.totalRounds;

    if (isFinished) {
      // ゲームを終了状態にする
      final finishedGame = await ref
          .read(currentGameProvider(widget.gameId).notifier)
          .finishGame();

      if (!mounted || finishedGame == null) return;

      // 結果画面へ遷移（Gameデータを直接渡す）
      context.go('/result/${widget.gameId}', extra: finishedGame);
    } else {
      // 次の問題へ（タイマーをリセットして再開）
      setState(() {
        _isProcessingAnswer = false;
        _showingFeedback = false;
        _selectedAnswer = null;
      });
      ref.read(gameTimerProvider.notifier).reset();
      ref.read(gameTimerProvider.notifier).start();
    }
  }

  void _handleTimeUp() {
    // タイムアップ時は空文字で回答
    _handleAnswer('');
  }

  @override
  Widget build(BuildContext context) {
    // 回答処理中（フィードバック表示中以外）はローディング表示
    if (_isProcessingAnswer && !_showingFeedback) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final gameAsync = ref.watch(currentGameProvider(widget.gameId));
    final questionAsync = ref.watch(currentQuestionProvider(widget.gameId));
    final currentRoundNumber = ref.watch(currentRoundProvider(widget.gameId));
    final timerSeconds = ref.watch(gameTimerProvider);

    // タイムアップのチェック
    ref.listen(isTimerFinishedProvider, (previous, next) {
      if (next && previous == false) {
        _handleTimeUp();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Package Guessr'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // 確認ダイアログを表示
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('ゲームを終了しますか？'),
                content: const Text('進行中のゲームは保存されません。'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('キャンセル'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      context.go('/');
                    },
                    child: const Text('終了'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      body: gameAsync.when(
        data: (game) {
          if (game == null) {
            return const Center(child: Text('ゲームが見つかりません'));
          }

          return questionAsync.when(
            data: (question) {
              if (question == null) {
                return const Center(child: Text('問題の読み込みに失敗しました'));
              }

              // 現在の問題のパッケージ名を保存
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _currentQuestionPackageName = question.targetPackage.name;
              });

              return SafeArea(
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // ラウンドとタイマーを1行に
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Round $currentRoundNumber / ${game.totalRounds}',
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 16),
                            const TimerDisplay(),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // コードスニペット
                        CodeSnippetViewer(snippets: question.snippets),
                        const SizedBox(height: 16),

                        // ヒント表示
                        HintDisplay(
                          package: question.targetPackage,
                          secondsRemaining: timerSeconds,
                        ),
                        const SizedBox(height: 16),

                        // 質問
                        Text(
                          'このコードはどのパッケージのものでしょうか？',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),

                        // 回答ボタン
                        AnswerButtons(
                          candidates: [...question.candidates, 'SKIP'],
                          onAnswer: _handleAnswer,
                          isEnabled: timerSeconds > 0 && !_showingFeedback,
                          canSkip: ref.watch(canSkipProvider(widget.gameId)),
                          selectedAnswer: _showingFeedback ? _selectedAnswer : null,
                          correctAnswer:
                              _showingFeedback ? _currentQuestionPackageName : null,
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    '問題の読み込みに失敗しました',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    error.toString(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text(
                'ゲームの読み込みに失敗しました',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                error.toString(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => context.go('/'),
                child: const Text('ホームに戻る'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
