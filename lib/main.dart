import 'package:app_motus/data/entities/word.dart';
import 'package:app_motus/ui/my_app.dart';
import 'package:app_motus/ui/screens/home/my_home_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(WordAdapter());
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => MyHomePageViewModel()),
  ], child: const MyApp()));
}