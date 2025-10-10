import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/game_provider.dart';
import '../providers/timer_provider.dart';
import '../widgets/code_snippet_viewer.dart';
import '../widgets/timer_display.dart';
import '../widgets/answer_buttons.dart';
import '../widgets/hint_display.dart';

class GameScreen extends ConsumerStatefulWidget {
  final String gameId;

  const GameScreen({
    super.key,
    required this.gameId,
  });

  @override
  ConsumerState<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen> {
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
    // タイマーを停止
    ref.read(gameTimerProvider.notifier).stop();
    super.dispose();
  }

  Future<void> _handleAnswer(String answer) async {
    // タイマーを停止
    ref.read(gameTimerProvider.notifier).stop();

    final timeRemaining = ref.read(gameTimerProvider);

    // 回答を送信
    await ref
        .read(currentGameProvider(widget.gameId).notifier)
        .submitAnswer(answer, timeRemaining);

    // ゲームが終了したかチェック
    final isFinished = ref.read(isGameFinishedProvider(widget.gameId));

    if (!mounted) return;

    if (isFinished) {
      // 結果画面へ遷移
      context.go('/result/${widget.gameId}');
    } else {
      // 次の問題へ（タイマーをリセットして再開）
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
        title: const Text('Package Guesser'),
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
            return const Center(
              child: Text('ゲームが見つかりません'),
            );
          }

          return questionAsync.when(
            data: (question) {
              if (question == null) {
                return const Center(
                  child: Text('問題の読み込みに失敗しました'),
                );
              }

              return SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      // ラウンド表示
                      Text(
                        'Round $currentRoundNumber / ${game.totalRounds}',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 16),

                      // タイマー
                      const TimerDisplay(),
                      const SizedBox(height: 24),

                      // コードスニペット
                      CodeSnippetViewer(
                        snippets: question.snippets,
                      ),
                      const SizedBox(height: 24),

                      // ヒント表示
                      HintDisplay(
                        package: question.targetPackage,
                        secondsRemaining: timerSeconds,
                      ),
                      const SizedBox(height: 24),

                      // 質問
                      Text(
                        'このコードはどのパッケージのものでしょうか？',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),

                      // 回答ボタン
                      AnswerButtons(
                        candidates: question.candidates,
                        onAnswer: _handleAnswer,
                        isEnabled: timerSeconds > 0,
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (error, stack) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    size: 64,
                    color: Colors.red,
                  ),
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
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 64,
                color: Colors.red,
              ),
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
