import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../pages/pages.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    log('The Route is: ${settings.name}');

    switch (settings.name) {
      case '/':
        return PageTransition(
            child: const AwaitScreen(),
            type: PageTransitionType.fade,
            duration: const Duration(milliseconds: 350));
      case '/login':
        return PageTransition(
            child: const LoginScreen(),
            type: PageTransitionType.fade,
            duration: const Duration(milliseconds: 350));
      case '/home':
        return PageTransition(
            child: const HomeScreen(),
            type: PageTransitionType.fade,
            duration: const Duration(milliseconds: 350));
      case '/survey':
        return PageTransition(
            child: const SurveyScreen(),
            type: PageTransitionType.fade,
            duration: const Duration(milliseconds: 350));

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(appBar: AppBar(title: const Text('error'))),
      settings: const RouteSettings(name: '/error'),
    );
  }
}
