import 'package:app_motus/data/entities/trash/trash.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../entities/game/game.dart';

class GameHive {
  static GameHive? _instance;
  static Box<Game>? _box;

  static Future<GameHive> getInstance() async {
    if (_instance == null) {
      _box = await Hive.openBox<Game>('Game');
      _instance = GameHive._();
    }
    return _instance!;
  }

  GameHive._();

  Future<void> insertGame(Game game) async {
    await _box?.add(game);
    // await _box?.close();
    return;
  }
}
