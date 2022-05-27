import 'package:app_motus/data/entities/word.dart';
import 'package:app_motus/ui/screens/home/my_home_page_viewmodel.dart';
import 'package:app_motus/ui/widgets/game_widget.dart';
import 'package:app_motus/ui/widgets/grid.dart';
import 'package:app_motus/ui/widgets/letter.dart';
import 'package:app_motus/ui/widgets/row_letter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    bool isWin = false;

    HomePageViewModel viewModel = context.read<HomePageViewModel>();

    viewModel.getRandomWordFromDico(viewModel.currentUser()!);

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Mot du jour :',
                    style: TextStyle(fontSize: 24),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Consumer<HomePageViewModel>(
                      builder: (context, model, child) => Text(
                        model.word != null ? model.word.toString() : "Vide",
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Consumer<HomePageViewModel>(
                  builder: (context, model, child) => GameWidget(
                        listWord: model.listWord!
                      )),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
