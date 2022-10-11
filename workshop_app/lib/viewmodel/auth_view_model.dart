import 'package:flutter/cupertino.dart';
import 'package:workshop_app/services/api.dart';

enum AuthViewState { initial, loading, success, error }

class AuthViewModel with ChangeNotifier {
  final Api api;
  AuthViewModel({required this.api});

  String _email = '';
  String _password = '';
  String _confirmPassword = '';
  AuthViewState _state = AuthViewState.initial;

  String get email => _email;
  String get password => _password;
  String get confirmPassword => _confirmPassword;
  AuthViewState get state => _state;

  set email(String value) {
    _email = value;
    notifyListeners();
  }

  set password(String value) {
    _password = value;
    notifyListeners();
  }

  set confirmPassword(String value) {
    _confirmPassword = value;
    notifyListeners();
  }

  set state(AuthViewState value) {
    _state = value;
    notifyListeners();
  }

  bool get isEmailValid => _email.isNotEmpty && _email.contains('@');

  bool get isPasswordValid => _password.isNotEmpty && _password.length >= 6;

  bool get isConfirmPasswordValid =>
      _confirmPassword.isNotEmpty && _confirmPassword.length >= 6;

  Future login() async {
    final params = {
      'email': _email,
      'password': _password,
    };

    state = AuthViewState.loading;

    // final response = await api.sendDataApi(params: params);
    // return response;
    await Future.delayed(const Duration(seconds: 2));
    if (_email == 'admin') {
      state = AuthViewState.success;
    } else {
      state = AuthViewState.error;
    }
  }
}
