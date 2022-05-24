import 'package:app_motus/data/entities/trash/trash.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../entities/word.dart';

class TrashHive {
  static TrashHive? _instance;
  static Box<Trash>? _box;

  static Future<TrashHive> getInstance() async {
    if (_instance == null) {
      _box = await Hive.openBox<Trash>('Trash');
      _instance = TrashHive._();
    }
    return _instance!;
  }

  TrashHive._();

  Future<void> insertWord(Trash trash) async {
    await _box?.add(trash);
   // await _box?.close();
    return;
  }
}
