
import 'package:flutter/material.dart';
import 'package:test/features/chat/presentation/views/chat_view.dart';
import 'package:test/features/home/presentation/views/home_view.dart';
import 'package:test/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:test/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case ChatView.routeName:
      return MaterialPageRoute(builder: (context) => const ChatView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
