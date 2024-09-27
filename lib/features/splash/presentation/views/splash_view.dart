import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/constants.dart';
import 'package:test/features/chat/presentation/providers/settings_provider.dart';

import 'widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const routeName = 'splash';
  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<SettingsProvider>().isDarkMode;

    return Scaffold(
      backgroundColor: isDarkMode ? kPrimaryDarkColor : kPrimaryLightColor,
      body: const SplashViewBody(),
    );
  }
}
