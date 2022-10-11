import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:workshop_app/config/colors.dart';

import '../../widgets/widgets.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _ForgotPassForm(),
    );
  }
}

class _ForgotPassForm extends StatelessWidget {
  const _ForgotPassForm();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            _LottiesIcon(),
            SizedBox(height: 20),
            _TextMessage(),
            SizedBox(height: 20),
            _EmailInput(),
            SizedBox(height: 20),
            _ResetPasswordButton(),
          ],
        ),
      ),
    );
  }
}

class _LottiesIcon extends StatelessWidget {
  const _LottiesIcon();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Lottie.asset(
        'assets/lotties/forgotPass.json',
      ),
    );
  }
}

class _TextMessage extends StatelessWidget {
  const _TextMessage();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            'Mot de passe oublié',
            style: const TextStyle(
              fontSize: 30,
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 300,
            child: Text(
              'Veuillez entrer votre adresse email. Vous recevrez un lien pour créer un nouveau mot de passe via email.',
              style: TextStyle(
                fontSize: 13,
                color: Colors.black.withOpacity(0.4),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomTextFormField(
        hintText: 'Email',
        onChanged: (value) => print(value),
        // context.read<ForgotPassCubit>().emailChanged(value),
      ),
    );
  }
}

class _ResetPasswordButton extends StatelessWidget {
  const _ResetPasswordButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: CustomButton(
        text: 'Réinitialiser le mot de passe',
        onPressed: () => print('Reset password'),
        color: AppColors.primary,
        textColor: Colors.white,
        borderRadius: 10,
        height: 50,
      ),
    );
  }
}
