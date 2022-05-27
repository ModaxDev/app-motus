import 'package:app_motus/data/entities/game/game.dart';
import 'package:app_motus/ui/widgets/row_letter.dart';
import 'package:flutter/material.dart';

import 'grid.dart';

class GameWidget extends StatefulWidget {
  const GameWidget({
    Key? key,
    required this.listWord,
    required this.onNewGame,
  }) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final List<String> listWord;

  final Function onNewGame;

  @override
  State<GameWidget> createState() => _Game();
}

class _Game extends State<GameWidget> {
  bool isEndGame = false;
  int tries = 0;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    if (isEndGame) {
      return Column(
        children: [Text("Game End in $tries tries" + " with score $score"),
        TextButton(onPressed: () => setState(() {
          isEndGame = false;
          score = 0;
        }), child: Text('Restart')),
          TextButton(onPressed: () => setState(() {
            widget.onNewGame();
            isEndGame = false;
          }), child: Text('Continue to play'))


        ],
      );
    }

    return Grid(
      onWin: (value) {
        setState(() {
          tries = value + 1;
          isEndGame = true;
          //divide 100 by the number of tries
          score = score+100 ~/ tries;
        });
      },
      listWord: widget.listWord,
      limitTries: 5,
    );
  }
}
