import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/constants.dart';
import 'package:test/features/chat/presentation/providers/settings_provider.dart';

import 'widgets/chat_view_body.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});
  static const routeName = 'chat';

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<SettingsProvider>().isDarkMode;

    return Scaffold(
      backgroundColor: isDarkMode ? kPrimaryDarkColor : kPrimaryLightColor,
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ChatViewBody(),
        ),
      ),
    );
  }
}
