import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AwaitScreen extends StatefulWidget {
  const AwaitScreen({super.key});

  @override
  State<AwaitScreen> createState() => _AwaitScreenState();
}

class _AwaitScreenState extends State<AwaitScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Welcome',
                    textStyle: const TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                    ),
                    speed: const Duration(milliseconds: 600),
                  ),
                ],
                isRepeatingAnimation: true,
                totalRepeatCount: 10,
              ),
              const SizedBox(height: 50),
              LoadingAnimationWidget.fourRotatingDots(
                size: 60,
                color: Colors.orange,
              )
            ],
          ),
        ),
      ),
    );
  }
}
