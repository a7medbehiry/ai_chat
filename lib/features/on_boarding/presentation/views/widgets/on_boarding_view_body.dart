import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:test/constants.dart';
import 'package:test/features/home/presentation/views/home_view.dart';

import '../../../../../core/services/shared_preferences_singleton.dart';
import 'custom_button.dart';
import 'on_boarding_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  var currentPage = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round(); 
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: OnBoardingPageView(
            pageController: pageController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: DotsIndicator(
            dotsCount: 3,
            position: currentPage,
            decorator: DotsDecorator(
              activeColor: const Color(0xFF10A37F),
              size: const Size.square(8.0),
              activeSize: const Size(28.0, 2.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        if (currentPage == 0 || currentPage == 1)
          CustomButton(
            title: 'Next',
            onPressed: () {
              if (currentPage < 2) {
                setState(() {
                  currentPage++;
                });
                pageController.animateToPage(
                  currentPage,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
          ),
        if (currentPage == 2)
          CustomButton(
            isHasIcon: true,
            title: 'Let’s Chat',
            onPressed: () {
              Pref.setBool(kIsOnBoardingViewSeen, true);
              Navigator.pushReplacementNamed(
                context,
                HomeView.routeName,
              );
            },
          ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
