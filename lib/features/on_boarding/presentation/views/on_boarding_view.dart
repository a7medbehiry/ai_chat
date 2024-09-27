import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/constants.dart';
import 'package:test/features/chat/presentation/providers/settings_provider.dart';

import 'widgets/on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static const routeName = 'onBoarding';

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<SettingsProvider>().isDarkMode;

    return Scaffold(
      backgroundColor: isDarkMode ? kPrimaryDarkColor : kPrimaryLightColor,
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: OnBoardingViewBody(),
        ),
      ),
    );
  }
}
