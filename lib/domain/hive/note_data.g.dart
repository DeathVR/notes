// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NoteDataAdapter extends TypeAdapter<NoteData> {
  @override
  final int typeId = 0;

  @override
  NoteData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NoteData(
      title: fields[0] as String,
      note: fields[1] as String,
    )..date = fields[2] as String;
  }

  @override
  void write(BinaryWriter writer, NoteData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.note)
      ..writeByte(2)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
