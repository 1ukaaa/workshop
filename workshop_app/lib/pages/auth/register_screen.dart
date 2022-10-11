import 'package:flutter/material.dart';
import 'package:workshop_app/config/colors.dart';

import '../../widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: RegisterForm(),
        ),
      ),
    );
  }
}

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const _TextMessage(),
            const SizedBox(height: 20),
            const _UsernameInput(),
            const SizedBox(height: 8),
            _EmailInput(),
            const SizedBox(height: 8),
            _PasswordInput(),
            const SizedBox(height: 8),
            _ConfirmPasswordInput(),
            const SizedBox(height: 20),
            const _AgreeWithTerms(),
            const SizedBox(height: 20),
            const RegisterButton(),
          ],
        ),
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
          'Créer un compte',
          style: const TextStyle(
            fontSize: 25,
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Veuillez remplir les champs ci-dessous',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black.withOpacity(0.4),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _UsernameInput extends StatelessWidget {
  const _UsernameInput();

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: 'Nom d\'utilisateur',
      onChanged: (value) => print(value),
      // context.read<RegisterCubit>().usernameChanged(value),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: 'Email',
      onChanged: (value) => print(value),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: 'Mot de passe',
      password: true,
      onChanged: (value) => print(value),
    );
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: 'Confirmer le mot de passe',
      password: true,
      onChanged: (value) => print(value),
    );
  }
}

class _AgreeWithTerms extends StatelessWidget {
  const _AgreeWithTerms();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.all(AppColors.primary),
          value: false,
          onChanged: (value) => print(value),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'En vous inscrivant, vous acceptez nos ',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                    fontSize: 16,
                  ),
                ),
                TextSpan(
                  text: 'Conditions d\'utilisation',
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ' et ',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                    fontSize: 16,
                  ),
                ),
                TextSpan(
                  text: 'Politique de confidentialité',
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'S\'inscrire',
      onPressed: () => print('Register'),
      color: AppColors.primary,
      textColor: Colors.white,
      borderRadius: 10,
      height: 50,
    );
  }
}
