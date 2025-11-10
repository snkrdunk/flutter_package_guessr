import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../domain/entities/game.dart';
import '../widgets/round_details_list.dart';
import '../widgets/score_summary_card.dart';

class ResultScreen extends StatelessWidget {
  final Game game;

  const ResultScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Result'),
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

              // Twitter シェアボタン
              _ShareButton(score: game.totalScore),
              const SizedBox(height: 16),

              // アクションボタン
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => context.go('/'),
                      icon: const Icon(Icons.home),
                      label: const Text('Home'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: () => context.go('/'),
                      icon: const Icon(Icons.replay),
                      label: const Text('Play Again'),
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.indigo,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ShareButton extends StatelessWidget {
  final int score;

  const _ShareButton({required this.score});

  Future<void> _shareToTwitter(BuildContext context) async {
    final text =
        'My 🐦Flutter Package Guessr🐦 score is $score!\nhttps://flutter-package-guessr.web.app/ #FlutterKaigi2025 #SODA #FlutterPackageGuessr';
    final encodedText = Uri.encodeComponent(text);
    final twitterUrl = Uri.parse(
      'https://twitter.com/intent/tweet?text=$encodedText',
    );

    try {
      if (await canLaunchUrl(twitterUrl)) {
        await launchUrl(twitterUrl, mode: LaunchMode.externalApplication);
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Twitterを開けませんでした')));
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('シェアに失敗しました')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: () => _shareToTwitter(context),
      icon: const Icon(Icons.share),
      label: const Text('Share your score'),
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        backgroundColor: const Color(0xFF1DA1F2), // Twitter blue color
      ),
    );
  }
}
