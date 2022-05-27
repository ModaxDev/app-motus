import 'package:app_motus/ui/screens/home/home_page.dart';
import 'package:app_motus/ui/screens/home/my_home_page.dart';
import 'package:app_motus/ui/screens/login/login_page.dart';
import 'package:app_motus/ui/screens/platane/my_platane.dart';
import 'package:beamer/beamer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  final BeamerDelegate routerDelegate = BeamerDelegate(
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '/': (context, state, data) => LoginPage(),
        '/home': (context, state, data) => HomePage(title: "GAME"),
        '/profil/:user': (context, state, data) {
          final User user = data as User;
          return BeamPage(child: Text(user.uid));
        }
      },
    ),
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: BeamerParser(),
      routerDelegate: routerDelegate,
      title: 'Flutter Demo',
      backButtonDispatcher:
          BeamerBackButtonDispatcher(delegate: routerDelegate),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.amber,
      ),
    );
  }
}
