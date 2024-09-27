import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/constants.dart';
import 'package:test/core/utils/app_text_styles.dart';
import 'package:test/features/chat/presentation/providers/settings_provider.dart';
import 'package:test/features/home/presentation/views/home_view.dart';

import '../../../../../core/services/shared_preferences_singleton.dart';
import '../../../../on_boarding/presentation/views/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    executeNavigation(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<SettingsProvider>().isDarkMode;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isDarkMode
                ? Image.asset('assets/images/splash.png')
                : Image.asset('assets/images/splash_dark.png'),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        isDarkMode
            ? const Text(
                'ChatGPT',
                style: AppTextStyles.bold40,
              )
            : Text(
                'ChatGPT',
                style: AppTextStyles.bold40.copyWith(color: Colors.black),
              ),
      ],
    );
  }

  void executeNavigation(BuildContext context) {
    bool isOnBoardingViewSeen = Pref.getBool(kIsOnBoardingViewSeen);
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (!context.mounted) return;

        if (isOnBoardingViewSeen) {
          Navigator.pushReplacementNamed(context, HomeView.routeName);
        } else {
          Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
        }
      },
    );
  }
}
