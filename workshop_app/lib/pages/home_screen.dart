import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:workshop_app/config/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: const _HomeScreenForm(),
        ),
      ),
    );
  }
}

class _HomeScreenForm extends StatelessWidget {
  const _HomeScreenForm();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: const [
        _Lotties(),
        SizedBox(height: 50),
        _HomeBox(),
      ],
    );
  }
}

class _Lotties extends StatelessWidget {
  const _Lotties();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: Lottie.asset(
          'assets/lotties/work.json',
          repeat: true,
          reverse: true,
          animate: true,
        ),
      ),
    );
  }
}

class _HomeBox extends StatelessWidget {
  const _HomeBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Text(
            'Health At Work',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          AutoSizeText(
            'Health At Work est une application mobile qui permet de suivre votre santé au travail. Elle vous permet de suivre votre état de santé, de vous informer sur les maladies professionnelles et de vous aider à prévenir les risques liés à votre travail.',
            maxLines: 5,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Spacer(),
          _HomeButton(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _HomeButton extends StatelessWidget {
  const _HomeButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.pushNamed(context, '/survey'),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(vertical: 15),
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: const Text('Suivant'),
    );
  }
}
