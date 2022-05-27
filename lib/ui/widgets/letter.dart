import 'package:flutter/material.dart';

class Letter extends StatefulWidget {
  const Letter(
      {Key? key,
      required this.letter,
      required this.letters,
      required this.letterSubmitValidation,
      required this.onWordFinished,
      required this.onLetterSelected,
      required this.index,
      required this.currentRowIndex,
      required this.rowIndex,
      required this.isEnabled,
      required this.isWin
      })
      : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String letterSubmitValidation;

  final bool isEnabled;

  final bool isWin;

  final String letter;

  final List<String> letters;

  final int index;

  final Function onLetterSelected;

  final Function onWordFinished;

  final int currentRowIndex;

  final int rowIndex;

  @override
  State<Letter> createState() => _Letter();
}

class _Letter extends State<Letter> {
  late TextEditingController _controller;

  final zwsp = '\u200b';

  void initState() {
    super.initState();
    _controller = TextEditingController(
        text: zwsp.toUpperCase() + widget.letter.toUpperCase());
  }

  Color customColor = Colors.black;

  changeColor() {
    if (widget.currentRowIndex > widget.rowIndex) {
      if (_controller.text.toUpperCase().replaceAll(zwsp, '') ==
          widget.letters[widget.index].toUpperCase()) {
        return Colors.red;
      }

      bool existed = false;
      for (var item in widget.letters) {
        if(item.replaceAll(zwsp, '').toUpperCase().contains(_controller.text.toUpperCase().replaceAll(zwsp, ''))) {
          existed = true;
          print(item);
        }
      }
      if(existed) {
        return Colors.orange;
      }

      if (widget.letters
          .where((element) => element
              .contains(_controller.text.toUpperCase().replaceAll(zwsp, '')))
          .isNotEmpty) {
        return Colors.orange;
      }
    }

    if(widget.isWin && widget.currentRowIndex ==  -1) {
      return Colors.red;
    }

  }

  @override
  Widget build(BuildContext context) {
    // return widget
    FocusNode fNode = FocusNode();
    return SizedBox(
        width: MediaQuery.of(context).size.width / widget.letters.length * .9,
        child: Container(
          margin: EdgeInsets.all(2),
          child: TextFormField(
              focusNode: fNode,
              autofocus: true,
              textInputAction: TextInputAction.next,
              onChanged: (value) {
                if (value.isEmpty) {
                  _controller.text = zwsp;
                }

                if (value.isNotEmpty) {
                  widget.onLetterSelected(value.substring(1), widget.index);
                }

                if (value.length > 1 &&
                    widget.index <= widget.letters.length - 1) {
                  FocusScope.of(context).nextFocus();
                } else {
                  FocusScope.of(context).previousFocus();
                }

                if (widget.index == widget.letters.length - 1) {
                  widget.onWordFinished();
                }
              },
              controller: _controller,
              maxLength: 2,
              enabled: widget.isEnabled,
              style: TextStyle(color: changeColor()),
              textCapitalization: TextCapitalization.characters,
              decoration: InputDecoration(contentPadding: EdgeInsets.all(5))),
        ));
  }
}
