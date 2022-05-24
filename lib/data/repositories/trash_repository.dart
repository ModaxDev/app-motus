
import 'package:app_motus/data/entities/trash/trash.dart';

import '../datasource/local/trash_hive.dart';

class TrashRepository{
  static TrashRepository? _instance;
  static TrashHive? _trashHive;

  static Future<TrashRepository> getInstance() async {
    if (_instance == null) {
      _trashHive = await TrashHive.getInstance();
      _instance = TrashRepository._();
    }
    return _instance!;
  }

  TrashRepository._();

  Future<Trash> insertWord(Trash trash) async {
    await _trashHive?.insertTrash(trash);
    return trash;
  }
}
