import 'package:app_motus/data/entities/word.dart';
import 'package:app_motus/data/repositories/word_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class MyHomePageViewModel with ChangeNotifier {

  late Word _word;

  Word get word => _word;

  //list string private var
  List<String> _listString = [];

  //list string public var
  List<String> get listString => _listString;



  Future<void> loadDictionnary() async {
    String dico = await rootBundle.loadString('assets/files/dico.txt');
    _listString = dico.split('\n').where((element) => element.length > 5).toList();
    notifyListeners();
  }

}
