
import 'package:app_motus/data/entities/word.dart';
import 'package:hive/hive.dart';

part 'game.g.dart';

@HiveType(typeId: 0)
class Game {
  @HiveField(0)
  DateTime? startDate;

  @HiveField(1)
  DateTime? endDate;

  @HiveField(2)
  String? player;

  @HiveField(3)
  double? score;

  @HiveField(4)
  Word? word;

  @HiveField(5)
  List<String>? tries;

  @HiveField(6)
  int? limitTries;

  Game({this.startDate, this.endDate, this.player, this.score, this.word, this.tries, this.limitTries});
}