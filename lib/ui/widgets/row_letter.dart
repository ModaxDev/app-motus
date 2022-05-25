import 'package:flutter/material.dart';

import 'letter.dart';

class RowLetter extends StatefulWidget {
  const RowLetter({Key? key, this.word, required this.printWord, required this.isRowSelected, required this.rowIndex, required this.currentSelectedRowIndex }) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final List<String>? word;
  final bool printWord;
  final bool isRowSelected;
  final int rowIndex;
  final int currentSelectedRowIndex;

  @override
  State<RowLetter> createState() => _RowLetter();
}

class _RowLetter extends State<RowLetter> {
  @override
  Widget build(BuildContext context) {

    //create list of string
    List<String> listWord = [];

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    // return widget
    return Row(
      children: [

        for (var i = 0; i < widget.word!.length; i++)
          Letter(
            onLetterSelected: (letter, index) {
              print('list $letter $index');
              listWord.add(letter);
            },
            isEnabled: widget.rowIndex == widget.currentSelectedRowIndex,
            index: i,
            letters: widget.word!.length,
            letter: widget.printWord ? widget.word![i] : '',
          )
      ],
    );
  }
}
