import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/core/utils/app_text_styles.dart';
import 'package:test/features/chat/presentation/providers/settings_provider.dart';

Widget customButton({
  required String title,
  required VoidCallback onPressed,
}) {
  return SizedBox(
    width: double.infinity,
    height: 48,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF10A37F),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
      ),
      child: Text(
        title,
        style: AppTextStyles.bold18,
      ),
    ),
  );
}

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.isHasIcon = false});
  final String title;
  final VoidCallback onPressed;
  final bool isHasIcon;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<SettingsProvider>().isDarkMode;

    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF10A37F),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
        ),
        child: isHasIcon
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isDarkMode
                      ? Text(
                          title,
                          style: AppTextStyles.bold18,
                        )
                      : Text(
                          title,
                          style: AppTextStyles.bold18
                              .copyWith(color: Colors.black),
                        ),
                  const SizedBox(
                    width: 12,
                  ),
                  isDarkMode
                      ? Image.asset('assets/images/on_boarding_3_arrow.png')
                      : Image.asset(
                          'assets/images/on_boarding_3_arrow_dark.png'),
                ],
              )
            : isDarkMode
                ? Text(
                    title,
                    style: AppTextStyles.bold18,
                  )
                : Text(
                    title,
                    style: AppTextStyles.bold18.copyWith(color: Colors.black),
                  ),
      ),
    );
  }
}
