import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: const Scaffold(
          body: _HomeScreenForm(),
        ));
  }
}

class _HomeScreenForm extends StatelessWidget {
  const _HomeScreenForm();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
