import 'package:flutter/material.dart';

class Letter extends StatefulWidget {
  const Letter({Key? key, required this.letter, required this.letters, required this.onLetterSelected,  required this.index, required this.isEnabled})
      : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final bool isEnabled;

  final String letter;

  final int letters;

  final int index;

  final Function onLetterSelected;

  @override
  State<Letter> createState() => _Letter();
}

class _Letter extends State<Letter> {
  late TextEditingController _controller;

  final zwsp = '\u200b';

  void initState() {
    super.initState();
    _controller = TextEditingController(text: zwsp + widget.letter);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    // return widget
    FocusNode fNode = FocusNode();
    return SizedBox(
        width: MediaQuery.of(context).size.width / widget.letters * .9,
        child: Container(
          margin: EdgeInsets.all(2),
          child: TextFormField(
              focusNode: fNode,
              autofocus: true,
              textInputAction: TextInputAction.next,
              onChanged: (value) {
                if (value.length == 0) {
                  _controller.text = zwsp;
                }
                if (value.length > 1 && widget.index < widget.letters - 1) {
                  FocusScope.of(context).nextFocus();
                }
                if(value.length < 2 && widget.index > 0) {
                  FocusScope.of(context).previousFocus();
                }
                widget.onLetterSelected(value.substring(1), widget.index);
              },
              controller: _controller,
              maxLength: 2,
              enabled: widget.isEnabled,
              decoration: InputDecoration(contentPadding: EdgeInsets.all(5))),
        ));
  }
}
