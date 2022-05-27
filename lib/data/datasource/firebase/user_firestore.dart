import 'package:app_motus/data/datasource/firebase/word_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../entities/my_user.dart';

class UserFirestore {
  static UserFirestore? _instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static late final CollectionReference<MyUser> _userRef;

  UserFirestore._();

  static UserFirestore getInstance() {
    if (_instance == null) {
      _firestore.collection('users').withConverter<MyUser>(
          fromFirestore: (snapshot, _) => MyUser.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson());
      _instance = UserFirestore._();
    }
    return _instance!;
  }

  Future<UserCredential> signInWithCredentials(
      {required String email, required String password}) async {
    UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  Future<UserCredential> signUp(
      {required String email, required String password}) async {
    UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  Future<bool> isSignIn() async {
    return _firebaseAuth.currentUser != null;
  }

  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  Future<void> insertUser(MyUser user) async {
    await _userRef.add(user);
  }
}
