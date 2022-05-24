import 'package:hive/hive.dart';

part 'word.g.dart';

@HiveType(typeId: 0)
class Word{
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? text;
  @HiveField(2)
  String? textlenght;
  @HiveField(3)
  bool? alreadyuse;
  @HiveField(4)
  DateTime? activedate;

  Word(this.id, this.text,this.textlenght,this.alreadyuse,this.activedate);
}