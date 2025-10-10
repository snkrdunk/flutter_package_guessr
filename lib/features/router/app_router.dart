import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../home/screens/home_screen.dart';
import '../home/screens/score_history_screen.dart';
import '../game/screens/game_screen.dart';
import '../result/screens/result_screen.dart';

/// アプリケーションのルート定義
final goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    // ホーム画面
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),

    // スコア履歴画面
    GoRoute(
      path: '/history',
      name: 'history',
      builder: (context, state) => const ScoreHistoryScreen(),
    ),

    // ゲーム画面
    GoRoute(
      path: '/game/:gameId',
      name: 'game',
      builder: (context, state) {
        final gameId = state.pathParameters['gameId']!;
        return GameScreen(gameId: gameId);
      },
    ),

    // 結果画面
    GoRoute(
      path: '/result/:gameId',
      name: 'result',
      builder: (context, state) {
        final gameId = state.pathParameters['gameId']!;
        return ResultScreen(gameId: gameId);
      },
    ),
  ],

  // エラーハンドリング
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 64, color: Colors.red),
          const SizedBox(height: 16),
          Text(
            'ページが見つかりません',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            state.uri.toString(),
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => context.go('/'),
            icon: const Icon(Icons.home),
            label: const Text('ホームに戻る'),
          ),
        ],
      ),
    ),
  ),
);
