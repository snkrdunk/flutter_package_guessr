import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../domain/entities/game.dart';
import '../widgets/score_summary_card.dart';
import '../widgets/round_details_list.dart';

class ResultScreen extends StatelessWidget {
  final Game game;

  const ResultScreen({
    super.key,
    required this.game,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ゲーム結果'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // スコアサマリー
                  ScoreSummaryCard(game: game),
                  const SizedBox(height: 24),

                  // ラウンド詳細
                  if (game.rounds.isNotEmpty) ...[
                    RoundDetailsList(rounds: game.rounds),
                    const SizedBox(height: 24),
                  ],

                  // アクションボタン
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () => context.go('/history'),
                          icon: const Icon(Icons.history),
                          label: const Text('履歴を見る'),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () => context.go('/'),
                          icon: const Icon(Icons.home),
                          label: const Text('ホームへ'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // もう一度プレイボタン
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: () => context.go('/'),
                      icon: const Icon(Icons.replay),
                      label: const Text('もう一度プレイ'),
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.indigo,
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
