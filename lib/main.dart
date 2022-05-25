import 'dart:io';

import 'package:app_motus/data/entities/word.dart';
import 'package:app_motus/ui/my_app.dart';
import 'package:app_motus/ui/screens/home/home_page_viewmodel.dart';
import 'package:app_motus/ui/screens/home/my_home_page_viewmodel.dart';
import 'package:app_motus/ui/screens/login/sign_in_and_sign_up_viewmodel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(WordAdapter());
  if (Platform.isIOS) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDymVq7h2t1NsIbM0KhBqwaNL2bOFXZ5RE",
            appId: "1:886913267321:ios:201bfbf7d808f3db76c6a8",
            messagingSenderId: "886913267321",
            projectId: "fluttermotus"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => HomePageViewModel()),
    ChangeNotifierProvider(create: (_) => SignInAnSignUpViewModel()),
  ], child: MyApp()));
}