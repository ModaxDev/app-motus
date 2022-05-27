import 'package:app_motus/ui/widgets/row_letter.dart';
import 'package:flutter/material.dart';

class Grid extends StatefulWidget {
  const Grid({Key? key, required this.listWord, required this.limitTries,required this.onWin}) : super(key: key);

  final Function onWin;

  final List<String> listWord;

  final int limitTries;

  @override
  State<Grid> createState() => _Grid();
}

class _Grid extends State<Grid> {
  @override
  int currentRow = 0;

  Widget build(BuildContext context) {

    return Column(
      children: [
        for (int i = 0; i < widget.limitTries; i++)
          i == 0
              ? RowLetter(
                  isFinished: () {
                    setState(() {
                      widget.onWin(currentRow);
                    });
                  },
                  isEndRow: () {
                    setState(() {
                      currentRow++;
                      if(currentRow == widget.limitTries) widget.onWin(currentRow);
                    });
                  },
                  currentSelectedRowIndex: currentRow,
                  rowIndex: i,
                  word: widget.listWord,
                  printWord: false,
                  isRowSelected: true,
                )
              : RowLetter(
                  isFinished: () {
                    setState(() {
                      widget.onWin(currentRow);
                    });
                  },
                  isEndRow: () {
                    setState(() {
                      currentRow++;
                      if(currentRow == widget.limitTries) widget.onWin(currentRow);
                    });
                  },
                  currentSelectedRowIndex: currentRow,
                  rowIndex: i,
                  word: widget.listWord,
                  printWord: false,
                  isRowSelected: true,
                )
      ],
    );
  }
}
