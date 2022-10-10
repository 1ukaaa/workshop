import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:workshop_app/pages/home_screen.dart';

import '../pages/pages.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    log('The Route is: ${settings.name}');

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());

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
