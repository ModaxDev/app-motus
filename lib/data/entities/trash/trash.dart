import 'package:hive/hive.dart';

part 'trash.g.dart';

@HiveType(typeId: 0)
class Trash {
  @HiveField(0)
  List<String>? words;

  Trash(this.words);
}