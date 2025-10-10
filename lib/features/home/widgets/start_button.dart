import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/home_provider.dart';

class StartButton extends ConsumerStatefulWidget {
  const StartButton({super.key});

  @override
  ConsumerState<StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends ConsumerState<StartButton> {
  final _nameController = TextEditingController();
  bool _showNameInput = false;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _handleStart() async {
    if (_showNameInput) {
      final name = _nameController.text.trim();
      if (name.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('名前を入力してください')),
        );
        return;
      }

      // ゲーム開始処理
      try {
        final game = await ref
            .read(gameStarterProvider.notifier)
            .startGame(name);

        if (mounted) {
          // ゲーム画面へ遷移
          context.go('/game/${game.id}');
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('エラーが発生しました: $e')),
          );
        }
      }
    } else {
      setState(() {
        _showNameInput = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 名前入力フィールド
        if (_showNameInput) ...[
          SizedBox(
            width: 300,
            child: TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'プレイヤー名',
                hintText: '名前を入力',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              onSubmitted: (_) => _handleStart(),
              autofocus: true,
            ),
          ),
          const SizedBox(height: 16),
        ],

        // スタートボタン
        ElevatedButton.icon(
          onPressed: _handleStart,
          icon: const Icon(Icons.play_arrow, size: 32),
          label: Text(
            _showNameInput ? 'ゲームスタート' : 'はじめる',
            style: const TextStyle(fontSize: 20),
          ),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 48,
              vertical: 20,
            ),
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Colors.white,
          ),
        ),

        // キャンセルボタン
        if (_showNameInput) ...[
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {
              setState(() {
                _showNameInput = false;
                _nameController.clear();
              });
            },
            child: const Text('キャンセル'),
          ),
        ],
      ],
    );
  }
}
