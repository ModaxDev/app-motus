import 'dart:ffi';

import 'package:app_motus/data/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SignInAnSignUpViewModel with ChangeNotifier {
  User? _user;

  User? get user => _user;

  bool? _isSignIn = false;

  bool? get isSignIn => _isSignIn;

  Future<void> SignIn({
    required String email,
    required String password,
  }) async {
    UserRepository userRepository = UserRepository.getInstance();
    try{
      _user = await userRepository.signIn(email: email, password: password);
    } on Exception catch (_) {
      _user ??= await userRepository.signUp(email: email, password: password);
    }
    notifyListeners();
    return;
  }

  Future<void>IsSignIn() async {
    UserRepository userRepository = UserRepository.getInstance();
    _isSignIn = await userRepository.isSignIn();
    notifyListeners();
  }
}
