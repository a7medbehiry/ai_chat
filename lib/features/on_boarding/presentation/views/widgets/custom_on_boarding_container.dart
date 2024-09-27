import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/core/utils/app_text_styles.dart';
import 'package:test/features/chat/presentation/providers/settings_provider.dart';

class CustomOnBoardingContainer extends StatelessWidget {
  const CustomOnBoardingContainer(
      {super.key, required this.firstText, required this.secondText});
  final String firstText, secondText;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<SettingsProvider>().isDarkMode;

    return Container(
      decoration: BoxDecoration(
        color: isDarkMode
            ? Colors.white.withOpacity(0.08)
            : Colors.black.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              isDarkMode
                  ? Text(
                      firstText,
                      style: AppTextStyles.med16,
                    )
                  : Text(
                      firstText,
                      style: AppTextStyles.med16.copyWith(color: Colors.black),
                    ),
              isDarkMode
                  ? Text(
                      secondText,
                      style: AppTextStyles.med16,
                    )
                  : Text(
                      secondText,
                      style: AppTextStyles.med16.copyWith(color: Colors.black),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
