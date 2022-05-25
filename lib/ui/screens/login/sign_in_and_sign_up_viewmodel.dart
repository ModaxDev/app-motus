import 'package:app_motus/data/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SignInAnSignUpViewModel with ChangeNotifier {
  User? _user;

  User? get user => _user;

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
}
