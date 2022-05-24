import 'package:app_motus/data/entities/word.dart';
import 'package:app_motus/data/repositories/game_repository.dart';
import 'package:app_motus/data/repositories/trash_repository.dart';
import 'package:app_motus/data/repositories/word_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../../../data/entities/game/game.dart';
import '../../../data/entities/trash/trash.dart';

class MyHomePageViewModel with ChangeNotifier {

  late Word _word;

  Word get word => _word;

  late Trash _trash;

  Trash get trash => _trash;

  late Game _game;

  Game get game => _game;

  //list string private var
  List<String> _listString = [];

  //list string public var
  List<String> get listString => _listString;

  Future<void> insertWord(Word word) async {
    WordRepository repository = await WordRepository.getInstance();
    repository.insertWord(word);
    _word = word;
    notifyListeners();
  }

  Future<void> insertTrash(Trash trash) async {
    TrashRepository repository = await TrashRepository.getInstance();
    repository.insertTrash(trash);
    _trash = trash;
    notifyListeners();
  }

  Future<void> insertGame(Game game) async {
    GameRepository repository = await GameRepository.getInstance();
    repository.insertGame(game);
    _game = game;
    notifyListeners();
  }

  Future<void> loadDictionnary() async {
    String dico = await rootBundle.loadString('assets/files/dico.txt');
    _listString = dico.split('\n').where((element) => element.length > 5).toList();
    notifyListeners();
  }

}
