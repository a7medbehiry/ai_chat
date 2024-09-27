import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:test/features/chat/presentation/providers/settings_provider.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../data/models/message.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.message,
  });
  final Message message;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<SettingsProvider>().isDarkMode;

    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: const BoxDecoration(
          color: Color(0xff10A37F),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          ),
        ),
        child: MarkdownBody(
          selectable: true,
          data: message.message.toString(),
          styleSheet: MarkdownStyleSheet(
            p: isDarkMode
                ? AppTextStyles.semiBold16
                : AppTextStyles.semiBold16.copyWith(color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class AIChatBubble extends StatelessWidget {
  const AIChatBubble({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<SettingsProvider>().isDarkMode;

    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: isDarkMode
                  ? Colors.white.withOpacity(0.20)
                  : Colors.black.withOpacity(0.20),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: message.isEmpty
                ? SizedBox(
                    child: SpinKitThreeBounce(
                      color: isDarkMode ? Colors.white : Colors.black,
                      size: 20.0,
                    ),
                  )
                : MarkdownBody(
                    selectable: true,
                    data: message,
                    styleSheet: MarkdownStyleSheet(
                      p: isDarkMode
                          ? AppTextStyles.semiBold16
                          : AppTextStyles.semiBold16
                              .copyWith(color: Colors.black),
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 8),
            child: Row(
              children: [
                isDarkMode
                    ? Image.asset('assets/images/like.png')
                    : Image.asset('assets/images/like_dark.png'),
                const SizedBox(
                  width: 16,
                ),
                isDarkMode
                    ? Image.asset('assets/images/dislike.png')
                    : Image.asset('assets/images/dislike_dark.png'),
                const SizedBox(
                  width: 40,
                ),
                GestureDetector(
                  onTap: () => _copyToClipboard(context),
                  child: Row(
                    children: [
                      isDarkMode
                          ? Image.asset('assets/images/copy.png')
                          : Image.asset('assets/images/copy_dark.png'),
                      const SizedBox(
                        width: 8,
                      ),
                      isDarkMode
                          ? const Text(
                              'Copy',
                              style: AppTextStyles.semiBold14,
                            )
                          : Text(
                              'Copy',
                              style: AppTextStyles.semiBold14
                                  .copyWith(color: Colors.black),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _copyToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: message)).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Copied to clipboard!')),
      );
    });
  }
}
