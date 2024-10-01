import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:test/features/chat/data/hive/boxes.dart';
import 'package:test/features/chat/presentation/providers/chat_provider.dart';
import 'package:test/features/chat/presentation/providers/settings_provider.dart';
import 'package:test/features/chat/presentation/views/chat_view.dart';
import 'package:test/features/home/presentation/views/widgets/chat_history_widget.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../chat/data/hive/chat_history.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late ChatProvider chatProvider;

  @override
  void initState() {
    super.initState();
    chatProvider = Provider.of<ChatProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<SettingsProvider>().isDarkMode;

    return Column(
      children: [
        const SizedBox(height: 24),
        ListTile(
          onTap: () async {
            await chatProvider.prepareChatRoom(isNewChat: true, chatID: '');
            Navigator.pushNamed(context, ChatView.routeName);
          },
          leading: isDarkMode
              ? Image.asset('assets/images/home_chat.png')
              : Image.asset('assets/images/home_chat_dark.png'),
          title: isDarkMode
              ? const Text('New Chat', style: AppTextStyles.bold16)
              : Text('New Chat',
                  style: AppTextStyles.bold16.copyWith(color: Colors.black)),
          trailing: isDarkMode
              ? Image.asset('assets/images/home_arrow.png')
              : Image.asset('assets/images/home_arrow_dark.png'),
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
        Expanded(
          child: ValueListenableBuilder<Box<ChatHistory>>(
            valueListenable: Boxes.getChatHistory().listenable(),
            builder: (context, box, _) {
              final chatHistory =
                  box.values.toList().cast<ChatHistory>().reversed.toList();
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: chatHistory.length,
                  itemBuilder: (context, index) {
                    final chat = chatHistory[index];
                    return ChatHistoryWidget(chat: chat);
                  },
                ),
              );
            },
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
        ListTile(
          onTap: () async {
            var chatBox = Boxes.getChatHistory();
            await chatBox.clear();
          },
          leading: isDarkMode
              ? Image.asset('assets/images/trash.png')
              : Image.asset('assets/images/trash_dark.png'),
          title: isDarkMode
              ? const Text('Clear conversations', style: AppTextStyles.med16)
              : Text('Clear conversations',
                  style: AppTextStyles.med16.copyWith(color: Colors.black)),
        ),
        ListTile(
          onTap: () {},
          leading: isDarkMode
              ? Image.asset('assets/images/person.png')
              : Image.asset('assets/images/person_dark.png'),
          title: isDarkMode
              ? const Text('Upgrade to Plus', style: AppTextStyles.med16)
              : Text('Upgrade to Plus',
                  style: AppTextStyles.med16.copyWith(color: Colors.black)),
          trailing: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFBF3AD),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Text('New', style: AppTextStyles.semiBold12),
            ),
          ),
        ),
        ListTile(
          onTap: () {
            final settingsProvider = context.read<SettingsProvider>();
            settingsProvider.toggleDarkMode(value: !isDarkMode);
          },
          leading: isDarkMode
              ? Image.asset('assets/images/on_boarding_1.png')
              : Image.asset('assets/images/on_boarding_1_dark.png'),
          title: isDarkMode
              ? const Text('Light mode', style: AppTextStyles.med16)
              : Text('Dark mode',
                  style: AppTextStyles.med16.copyWith(color: Colors.black)),
        ),
        ListTile(
          onTap: () {},
          leading: isDarkMode
              ? Image.asset('assets/images/update.png')
              : Image.asset('assets/images/update_dark.png'),
          title: isDarkMode
              ? const Text('Updates & FAQ', style: AppTextStyles.med16)
              : Text('Updates & FAQ',
                  style: AppTextStyles.med16.copyWith(color: Colors.black)),
        ),
        ListTile(
          onTap: () async {
            var chatBox = Boxes.getChatHistory();
            await chatBox.clear();
          },
          leading: Image.asset('assets/images/log_out.png'),
          title: Text(
            'Logout',
            style: AppTextStyles.med16.copyWith(color: const Color(0xFFED8C8C)),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
