import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/core/utils/app_text_styles.dart';
import 'package:test/features/chat/presentation/providers/settings_provider.dart';

import '../../data/models/page_view_item_model.dart';
import 'custom_on_boarding_container.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key, required this.pageViewItemModel});
  final PageViewItemModel pageViewItemModel;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<SettingsProvider>().isDarkMode;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          Image.asset(pageViewItemModel.firstImage),
          const SizedBox(
            height: 24,
          ),
          isDarkMode ?
          Text(
            pageViewItemModel.firstText,
            style: AppTextStyles.bold32,
          ) : Text(
            pageViewItemModel.firstText,
            style: AppTextStyles.bold32.copyWith(color: Colors.black),
          ),
          isDarkMode ?
          Text(
            pageViewItemModel.secondText,
            style: AppTextStyles.bold32,
          ): Text(
            pageViewItemModel.secondText,
            style: AppTextStyles.bold32.copyWith(color: Colors.black),
          ),
          const SizedBox(
            height: 24,
          ),
          isDarkMode ?
          Text(
            pageViewItemModel.thirdText,
            style: AppTextStyles.semiBold16,
          ) :  Text(
            pageViewItemModel.thirdText,
            style: AppTextStyles.semiBold16.copyWith(color: Colors.black),
          ) ,
          const SizedBox(
            height: 60,
          ),
          Image.asset(pageViewItemModel.secondImage),
          const SizedBox(
            height: 12,
          ),
          isDarkMode ?
          Text(
            pageViewItemModel.fourthText,
            style: AppTextStyles.med20,
          ) : Text(
            pageViewItemModel.fourthText,
            style: AppTextStyles.med20.copyWith(color: Colors.black),
          ),
          const SizedBox(
            height: 40,
          ),
          CustomOnBoardingContainer(
            firstText: pageViewItemModel.firstContainerFirstText,
            secondText: pageViewItemModel.firstContainerSecondText,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomOnBoardingContainer(
            firstText: pageViewItemModel.secondContainerFirstText,
            secondText: pageViewItemModel.secondContainerSecondText,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomOnBoardingContainer(
            firstText: pageViewItemModel.thirdContainerFirstText,
            secondText: pageViewItemModel.thirdContainerSecondText,
          ),
        ],
      ),
    );
  }
}
