import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/features/chat/presentation/views/chat_view.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../chat/data/hive/chat_history.dart';
import '../../../../chat/presentation/providers/chat_provider.dart';
import '../../../../chat/presentation/providers/settings_provider.dart';

class ChatHistoryWidget extends StatelessWidget {
  const ChatHistoryWidget({
    super.key,
    required this.chat,
  });

  final ChatHistory chat;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<SettingsProvider>().isDarkMode;

    return Column(
      children: [
        ListTile(
          onTap: () async {
            final chatProvider = context.read<ChatProvider>();
            await chatProvider.prepareChatRoom(
              isNewChat: false,
              chatID: chat.chatId,
            );
            Navigator.pushNamed(
              context,
              ChatView.routeName,
            );
          },
          leading: isDarkMode
              ? Image.asset('assets/images/chat.png')
              : Image.asset('assets/images/chat_dark.png'),
          title: isDarkMode
              ? Text(
                  chat.prompt,
                  maxLines: 2,
                  style: AppTextStyles.med16,
                )
              : Text(
                  chat.prompt,
                  maxLines: 2,
                  style: AppTextStyles.med16.copyWith(color: Colors.black),
                ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              PopupMenuButton<String>(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                color: isDarkMode
                    ? const Color(0xFF343541)
                    : const Color(0xFFEDEDED),
                icon: isDarkMode
                    ? Image.asset('assets/images/setting.png')
                    : Image.asset('assets/images/setting_dark.png'),
                onSelected: (value) async {
                  if (value == 'delete') {
                    await context
                        .read<ChatProvider>()
                        .deletChatMessages(chatId: chat.chatId);
                    await chat.delete();
                  } else if (value == 'edit') {
                    log('Edit chat: ${chat.chatId}');
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'edit',
                    child: Row(
                      children: [
                        isDarkMode
                            ? Image.asset('assets/images/edit.png')
                            : Image.asset('assets/images/edit_dark.png'),
                        const SizedBox(width: 8),
                        isDarkMode
                            ? const Text('Edit', style: AppTextStyles.med12)
                            : Text('Edit',
                                style: AppTextStyles.med12
                                    .copyWith(color: Colors.black)),
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'delete',
                    child: Row(
                      children: [
                        Image.asset('assets/images/delete.png'),
                        const SizedBox(width: 8),
                        Text(
                          'Delete',
                          style: AppTextStyles.med12
                              .copyWith(color: const Color(0xFFED8C8C)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 12,
              ),
              isDarkMode
                  ? Image.asset('assets/images/home_arrow.png')
                  : Image.asset('assets/images/home_arrow_dark.png'),
            ],
          ),
        ),
        isDarkMode
            ? Divider(
                thickness: 1,
                color: Colors.white.withOpacity(0.40),
                height: 0,
              )
            : Divider(
                thickness: 1,
                color: Colors.black.withOpacity(0.40),
                height: 0,
              ),
      ],
    );
  }
}
