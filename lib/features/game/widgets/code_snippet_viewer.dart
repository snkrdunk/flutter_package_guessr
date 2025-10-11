import 'package:flutter/material.dart';

/// コードスニペットを表示するウィジェット
class CodeSnippetViewer extends StatefulWidget {
  final List<String> snippets;
  final VoidCallback? onSnippetChange;

  const CodeSnippetViewer({
    super.key,
    required this.snippets,
    this.onSnippetChange,
  });

  @override
  State<CodeSnippetViewer> createState() => _CodeSnippetViewerState();
}

class _CodeSnippetViewerState extends State<CodeSnippetViewer> {
  int _currentIndex = 0;

  void _changeSnippet(int delta) {
    setState(() {
      _currentIndex = (_currentIndex + delta) % widget.snippets.length;
      if (_currentIndex < 0) {
        _currentIndex = widget.snippets.length - 1;
      }
    });
    widget.onSnippetChange?.call();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.snippets.isEmpty) {
      return const Center(
        child: Text('スニペットがありません'),
      );
    }

    final screenWidth = MediaQuery.of(context).size.width;
    final circleSize = screenWidth > 600 ? 450.0 : screenWidth * 0.80;

    return Column(
      children: [
        // スニペットカウンター
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            'スニペット ${_currentIndex + 1}/${widget.snippets.length}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),

        // 円形窓のコードビューア
        Stack(
          alignment: Alignment.center,
          children: [
            // 円形の窓
            Container(
              width: circleSize,
              height: circleSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF1E1E1E),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: ClipOval(
                child: InteractiveViewer(
                  minScale: 0.5,
                  maxScale: 3.0,
                  boundaryMargin: const EdgeInsets.all(double.infinity),
                  child: Container(
                    padding: const EdgeInsets.all(32),
                    child: Center(
                      child: SingleChildScrollView(
                        child: SelectableText(
                          widget.snippets[_currentIndex],
                          style: const TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 13,
                            color: Color(0xFFD4D4D4),
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // 左矢印ボタン
            if (widget.snippets.length > 1)
              Positioned(
                left: 0,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios, size: 32),
                  color: Colors.indigo,
                  onPressed: () => _changeSnippet(-1),
                  tooltip: '前のスニペット',
                ),
              ),

            // 右矢印ボタン
            if (widget.snippets.length > 1)
              Positioned(
                right: 0,
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios, size: 32),
                  color: Colors.indigo,
                  onPressed: () => _changeSnippet(1),
                  tooltip: '次のスニペット',
                ),
              ),
          ],
        ),
      ],
    );
  }
}
