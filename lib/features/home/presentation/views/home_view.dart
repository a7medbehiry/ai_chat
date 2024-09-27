import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/constants.dart';
import 'package:test/features/chat/presentation/providers/settings_provider.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = 'home';
  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<SettingsProvider>().isDarkMode;

    return Scaffold(
      backgroundColor:
          isDarkMode ? const Color(0xFF202123) : kPrimaryLightColor,
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: HomeViewBody(),
        ),
      ),
    );
  }
}
