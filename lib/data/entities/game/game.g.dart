// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GameAdapter extends TypeAdapter<Game> {
  @override
  final int typeId = 0;

  @override
  Game read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Game(
      startDate: fields[0] as DateTime?,
      endDate: fields[1] as DateTime?,
      player: fields[2] as String?,
      score: fields[3] as double?,
      word: fields[4] as Word?,
      tries: (fields[5] as List?)?.cast<String>(),
      limitTries: fields[6] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Game obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.startDate)
      ..writeByte(1)
      ..write(obj.endDate)
      ..writeByte(2)
      ..write(obj.player)
      ..writeByte(3)
      ..write(obj.score)
      ..writeByte(4)
      ..write(obj.word)
      ..writeByte(5)
      ..write(obj.tries)
      ..writeByte(6)
      ..write(obj.limitTries);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
