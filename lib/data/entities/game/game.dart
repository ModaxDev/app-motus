
import 'package:app_motus/data/entities/word.dart';

class Game {
  DateTime? startDate;

  DateTime? endDate;

  String? player;

  double? score;

  Word? word;

  List<String>? tries;

  int? limitTries;

  Game({this.startDate, this.endDate, this.player, this.score, this.word, this.tries, this.limitTries});
}