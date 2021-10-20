// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'std.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveRoleAdapter extends TypeAdapter<HiveRole> {
  @override
  final int typeId = 0;

  @override
  HiveRole read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveRole(
      id: fields[1] as String,
      name: fields[2] as String,
      school: fields[3] as String,
      grade: fields[4] as String,
      classNum: fields[5] as String,
      phone: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveRole obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.phone)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.school)
      ..writeByte(4)
      ..write(obj.grade)
      ..writeByte(5)
      ..write(obj.classNum);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveRoleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
