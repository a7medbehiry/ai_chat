import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/features/chat/presentation/providers/settings_provider.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../providers/chat_provider.dart';
import 'bottom_chat_field.dart';
import 'chat_messages.dart';

class ChatViewBody extends StatefulWidget {
  const ChatViewBody({super.key});

  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends State<ChatViewBody> {
  final TextEditingController controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<SettingsProvider>().isDarkMode;

    return Consumer<ChatProvider>(
      builder: (context, chatProvider, child) {
        if (chatProvider.inChatMessages.isNotEmpty) {
          _scrollToBottom();
        }

        chatProvider.addListener(() {
          if (chatProvider.inChatMessages.isNotEmpty) {
            _scrollToBottom();
          }
        });

        return Column(
          children: [
            const SizedBox(height: 24),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context, true);
                  },
                  child: Row(
                    children: [
                      isDarkMode
                          ? Image.asset('assets/images/chat_arrow.png')
                          : Image.asset('assets/images/chat_arrow_dark.png'),
                      const SizedBox(width: 16),
                      isDarkMode
                          ? const Text('Back', style: AppTextStyles.semiBold16)
                          : Text('Back',
                              style: AppTextStyles.semiBold16
                                  .copyWith(color: Colors.black)),
                    ],
                  ),
                ),
                const Spacer(),
                isDarkMode
                    ? Image.asset('assets/images/logo.png')
                    : Image.asset('assets/images/logo_dark.png'),
              ],
            ),
            const SizedBox(height: 20),
            Divider(
              thickness: 1,
              color: isDarkMode
                  ? Colors.white.withOpacity(0.40)
                  : Colors.black.withOpacity(0.40),
              height: 0,
            ),
            Expanded(
              child: chatProvider.inChatMessages.isEmpty
                  ? Center(
                      child: isDarkMode
                          ? Text(
                              'Ask anything, get your answer',
                              style: AppTextStyles.semiBold16.copyWith(
                                color: Colors.white.withOpacity(0.40),
                              ),
                            )
                          : Text(
                              'Ask anything, get your answer',
                              style: AppTextStyles.semiBold16.copyWith(
                                color: Colors.black.withOpacity(0.40),
                              ),
                            ),
                    )
                  : ChatMessages(
                      scrollController: _scrollController,
                      chatProvider: chatProvider,
                    ),
            ),
            if (chatProvider.inChatMessages.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF202123),
                    borderRadius: BorderRadius.circular(8),
                    border: isDarkMode
                        ? Border.all(
                            color: Colors.white.withOpacity(0.20),
                          )
                        : Border.all(
                            color: Colors.black.withOpacity(0.20),
                          ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 7, vertical: 9),
                    child: GestureDetector(
                      onTap: () {
                        chatProvider.regenerateLastResponse();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/regenerate.png'),
                          const SizedBox(width: 10),
                          const Text(
                            'Regenerate response',
                            style: AppTextStyles.med14,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            const SizedBox(
              height: 16,
            ),
            BottomChatField(chatProvider: chatProvider),
            const SizedBox(height: 32),
          ],
        );
      },
    );
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    controller.dispose();
    super.dispose();
  }
}
