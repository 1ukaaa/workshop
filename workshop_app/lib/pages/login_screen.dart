import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:workshop_app/viewmodel/auth_view_model.dart';

import '../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: _LoginForm(),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const _LottieIcon(),
            const _TextMessage(),
            const SizedBox(height: 20),
            _EmailInput(),
            const SizedBox(height: 8),
            _PasswordInput(),
            const SizedBox(height: 8),
            const _ForgotPassword(),
            _LoginButton(),
            _RegisterButton(),
          ],
        ),
      ),
    );
  }
}

class _LottieIcon extends StatelessWidget {
  const _LottieIcon();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/lotties/health.json',
        repeat: true,
        reverse: true,
        animate: true,
      ),
    );
  }
}

class _TextMessage extends StatelessWidget {
  const _TextMessage();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Bienvenue sur',
          style: const TextStyle(
            fontSize: 35,
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Health At Work',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black.withOpacity(0.4),
          ),
        ),
      ],
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomTextFormField(
        hintText: 'Email',
        onChanged: (value) => context.read<AuthViewModel>().email = value,
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomTextFormField(
        hintText: 'Mot de passe',
        password: true,
        onChanged: (value) => context.read<AuthViewModel>().password = value,
      ),
    );
  }
}

class _ForgotPassword extends StatelessWidget {
  const _ForgotPassword();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        alignment: Alignment.centerRight,
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          // onTap: () => Navigator.pushNamed(context, '/forgotpass'),
          child: Text(
            'Mot de passe oublié ?',
            style: const TextStyle(
              fontSize: 15,
              color: Colors.amber,
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final email = context.watch<AuthViewModel>().email;
    final password = context.watch<AuthViewModel>().password;
    final state = context.read<AuthViewModel>().state;
    if (state == AuthViewState.loading) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: const Center(
            child: CircularProgressIndicator(color: Colors.orange)),
      );
    }
    if (state == AuthViewState.success) {
      return Center(
        child: Lottie.asset(
          'assets/lotties/success.json',
          width: 70,
        ),
      );
    }
    if (state == AuthViewState.error) {
      return Center(
        child: Lottie.asset(
          'assets/lotties/error.json',
          width: 70,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: CustomButton(
        text: 'Se connecter',
        onPressed: () async {
          email.isNotEmpty || password.isNotEmpty
              ? {
                  await context.read<AuthViewModel>().login(),
                  if (context.read<AuthViewModel>().state ==
                      AuthViewState.success)
                    {
                      await successNotificationBar(
                          context, 'Connexion réussie !'),
                      Navigator.pushNamed(context, '/home'),
                    }
                  else
                    {
                      await failedNotificationBar(
                          context, 'Email ou mot de passe incorrect'),
                      context.read<AuthViewModel>().state =
                          AuthViewState.initial,
                    }
                }
              : failedNotificationBar(
                  context, 'Veuillez remplir tous les champs');
        },
        color: Colors.orange,
        textColor: Colors.white,
        borderRadius: 10,
        height: 50,
      ),
    );
  }
}

class _RegisterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: 'Pas encore de compte ? ',
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
          children: <TextSpan>[
            TextSpan(
              text: 'S\'inscrire',
              style: const TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => Navigator.pushNamed(context, '/register'),
            ),
          ],
        ),
      ),
    );
  }
}