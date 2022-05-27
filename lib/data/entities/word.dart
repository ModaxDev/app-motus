import 'package:hive/hive.dart';

part 'word.g.dart';

@HiveType(typeId: 0)
class Word {
  @HiveField(1)
  String? text;
  @HiveField(2)
  DateTime? activeDate;

  Word(this.text, this.activeDate);

  Word.fromJson(Map<String, Object?> json)
      : this(
      json['text'] as String?,
      json['activeDate'] as DateTime?
  );

  Map<String, dynamic> toJson() => {
    'text': text,
    'activeDate': activeDate,
  };

}