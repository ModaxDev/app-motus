import 'package:flutter/material.dart';

class Letter extends StatefulWidget {
  const Letter({Key? key, required this.letter}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String letter;

  @override
  State<Letter> createState() => _Letter();
}

class _Letter extends State<Letter> {
  late TextEditingController _controller;

  void initState() {
    super.initState();

    _controller = TextEditingController(text: widget.letter);
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
    return SizedBox(
        width: 40,
        child: Container(
          padding: EdgeInsets.fromLTRB(5,0,5,0),
          child: TextField(
              controller: _controller,
              maxLength: 1,
              decoration: InputDecoration(contentPadding: EdgeInsets.all(10))),
        ));
  }
}
