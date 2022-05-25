import 'dart:math';

import 'package:app_motus/data/entities/word.dart';
import 'package:app_motus/data/repositories/word_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class HomePageViewModel with ChangeNotifier {

  //list string private var
  List<String> _listDico = [];

  //list string public var
  List<String> get listDico => _listDico;


  String? _word;

  String? get word => _word;

  List<String>? _listWord = [];

  List<String>? get listWord => _listWord;


  Future<void> getAllWordDico() async {
    String dico = await rootBundle.loadString('assets/files/dico.txt');
    _listDico = dico.split('\n').where((element) => element.length > 5).toList();
    notifyListeners();
  }



  Future<void> getRandomWordFromDico() async {
    _listWord = [];
    String dico = await rootBundle.loadString('assets/files/dico.txt');
    _listDico = dico.split('\n').where((element) => element.length > 5).toList();
    String theWord = _listDico[Random().nextInt(_listDico.length)];
    _word = theWord;
    List<String>? list = _word?.split('');
    list?.removeLast();
    _listWord = list;
    notifyListeners();
  }

}
