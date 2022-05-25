import 'package:app_motus/data/entities/word.dart';
import 'package:app_motus/ui/screens/home/my_home_page_viewmodel.dart';
import 'package:app_motus/ui/widgets/grid.dart';
import 'package:app_motus/ui/widgets/letter.dart';
import 'package:app_motus/ui/widgets/row_letter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    HomePageViewModel viewModel = context.read<HomePageViewModel>();

    viewModel.getRandomWordFromDico();

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
                builder: (context, model, child) =>
                    Grid(listWord: model.listWord!, currentRow: 1)
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
