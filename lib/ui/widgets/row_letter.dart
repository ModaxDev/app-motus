import 'package:flutter/material.dart';
import 'dart:convert';

import 'letter.dart';

class RowLetter extends StatefulWidget {
  const RowLetter(
      {Key? key,
      this.word,
      required this.printWord,
      required this.isEndRow,
      required this.isRowSelected,
      required this.isFinished,
      required this.rowIndex,
      required this.currentSelectedRowIndex})
      : super(key: key);

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
  final Function isEndRow;
  final Function isFinished;

  @override
  State<RowLetter> createState() => _RowLetter();
}

class _RowLetter extends State<RowLetter> {

  bool isFinish = false;
  @override
  Widget build(BuildContext context) {
    //create list of string
    Map<int, String> listWord = Map<int, String>();

    return Row(
      children: [
        for (var i = 0; i < widget.word!.length; i++)
          Letter(
            isWin: isFinish,
            rowIndex: widget.rowIndex,
            currentRowIndex: widget.currentSelectedRowIndex,
            letterSubmitValidation: "",
            onWordFinished: () {
              String? word = widget.word![0] + listWord.values.join();
              if (word.toUpperCase() != widget.word!.join().toString().toUpperCase()) {
                widget.isEndRow();
              }else{
                isFinish = true;
                widget.isFinished();
              }
            },
            onLetterSelected: (letter, index) {
              listWord.addAll({index: letter});
            },
            isEnabled: i == 0
                ? false
                : widget.rowIndex == widget.currentSelectedRowIndex,
            index: i,
            letters: widget.word!,
            letter: i == 0
                ? widget.word![i]
                : widget.printWord
                    ? widget.word![i]
                    : '',
          )
      ],
    );
  }
}
