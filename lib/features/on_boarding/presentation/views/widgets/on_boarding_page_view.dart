import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/features/chat/presentation/providers/settings_provider.dart';
import 'package:test/features/on_boarding/presentation/data/models/page_view_item_model.dart';

import 'page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;
  static const darkItems = [
    PageViewItemModel(
      firstImage: 'assets/images/logo.png',
      secondImage: 'assets/images/on_boarding_1.png',
      firstText: 'Welcome to',
      secondText: 'ChatGPT',
      thirdText: 'Ask anything, get your answer',
      fourthText: 'Examples',
      firstContainerFirstText: '“Explain quantum computing in',
      firstContainerSecondText: 'simple terms”',
      secondContainerFirstText: '“Got any creative ideas for a 10',
      secondContainerSecondText: 'year old’s birthday?”',
      thirdContainerFirstText: '“How do I make an HTTP request',
      thirdContainerSecondText: 'in Javascript?”',
    ),
    PageViewItemModel(
      firstImage: 'assets/images/logo.png',
      secondImage: 'assets/images/on_boarding_2.png',
      firstText: 'Welcome to',
      secondText: 'ChatGPT',
      thirdText: 'Ask anything, get your answer',
      fourthText: 'Capabilities',
      firstContainerFirstText: 'Remembers what user said earlier',
      firstContainerSecondText: 'in the conversation',
      secondContainerFirstText: '“Allows user to provide follow-up',
      secondContainerSecondText: 'corrections',
      thirdContainerFirstText: 'Trained to decline inappropriate',
      thirdContainerSecondText: 'requests',
    ),
    PageViewItemModel(
      firstImage: 'assets/images/logo.png',
      secondImage: 'assets/images/on_boarding_3.png',
      firstText: 'Welcome to',
      secondText: 'ChatGPT',
      thirdText: 'Ask anything, get your answer',
      fourthText: 'Limitations',
      firstContainerFirstText: 'May occasionally generate',
      firstContainerSecondText: 'incorrect information',
      secondContainerFirstText: 'May occasionally produce harmful',
      secondContainerSecondText: 'instructions or biased content',
      thirdContainerFirstText: 'Limited knowledge of world and',
      thirdContainerSecondText: 'events after 2021',
    ),
  ];

  static const lightItems = [
    PageViewItemModel(
      firstImage: 'assets/images/logo_dark.png',
      secondImage: 'assets/images/on_boarding_1_dark.png',
      firstText: 'Welcome to',
      secondText: 'ChatGPT',
      thirdText: 'Ask anything, get your answer',
      fourthText: 'Examples',
      firstContainerFirstText: '“Explain quantum computing in',
      firstContainerSecondText: 'simple terms”',
      secondContainerFirstText: '“Got any creative ideas for a 10',
      secondContainerSecondText: 'year old’s birthday?”',
      thirdContainerFirstText: '“How do I make an HTTP request',
      thirdContainerSecondText: 'in Javascript?”',
    ),
    PageViewItemModel(
      firstImage: 'assets/images/logo_dark.png',
      secondImage: 'assets/images/on_boarding_2_dark.png',
      firstText: 'Welcome to',
      secondText: 'ChatGPT',
      thirdText: 'Ask anything, get your answer',
      fourthText: 'Capabilities',
      firstContainerFirstText: 'Remembers what user said earlier',
      firstContainerSecondText: 'in the conversation',
      secondContainerFirstText: '“Allows user to provide follow-up',
      secondContainerSecondText: 'corrections',
      thirdContainerFirstText: 'Trained to decline inappropriate',
      thirdContainerSecondText: 'requests',
    ),
    PageViewItemModel(
      firstImage: 'assets/images/logo_dark.png',
      secondImage: 'assets/images/on_boarding_3_dark.png',
      firstText: 'Welcome to',
      secondText: 'ChatGPT',
      thirdText: 'Ask anything, get your answer',
      fourthText: 'Limitations',
      firstContainerFirstText: 'May occasionally generate',
      firstContainerSecondText: 'incorrect information',
      secondContainerFirstText: 'May occasionally produce harmful',
      secondContainerSecondText: 'instructions or biased content',
      thirdContainerFirstText: 'Limited knowledge of world and',
      thirdContainerSecondText: 'events after 2021',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<SettingsProvider>().isDarkMode;

    return PageView(
      controller: pageController,
      children: isDarkMode
          ? darkItems.map((e) => PageViewItem(pageViewItemModel: e)).toList()
          : lightItems.map((e) => PageViewItem(pageViewItemModel: e)).toList(),
    );

    // return GestureDetector(
    //   onHorizontalDragUpdate: (details) {
    //     if (details.delta.dx != 0) {
    //       return;
    //     }
    //   },
    //   child: PageView(
    //     controller: pageController,
    //     physics: const NeverScrollableScrollPhysics(),
    //     children: isDarkMode
    //         ? darkItems.map((e) => PageViewItem(pageViewItemModel: e)).toList()
    //         : lightItems
    //             .map((e) => PageViewItem(pageViewItemModel: e))
    //             .toList(),
    //   ),
    // );
  }
}
