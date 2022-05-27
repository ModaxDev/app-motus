import 'package:firebase_auth/firebase_auth.dart';

import '../datasource/firebase/user_firestore.dart';

class UserRepository {
  static UserRepository? _instance;
  static final UserFirestore _userFirstore = UserFirestore.getInstance();

  static UserRepository getInstance() {
    _instance ??= UserRepository._();
    return _instance!;
  }

  UserRepository._();

  Future<User?> signIn({required String email, required String password}) async {
    UserCredential userCredential = await _userFirstore.signInWithCredentials(
        email: email, password: password);
    return userCredential.user;
  }

  Future<User?> signUp({required String email, required String password}) async {
    UserCredential userCredential =
        await _userFirstore.signUp(email: email, password: password);
    return userCredential.user;
  }

  Future<bool> isSignIn() async {
    return await _userFirstore.isSignIn();
  }

  User? currentUser() {
    return  _userFirstore.getCurrentUser();
  }
}
