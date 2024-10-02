// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fund.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FundAdapter extends TypeAdapter<Fund> {
  @override
  final int typeId = 0;

  @override
  Fund read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Fund(
      ma_nguoi_dung: fields[0] as int,
      amount: fields[2] as int,
      category: fields[1] as String,
      iconCode: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Fund obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.ma_nguoi_dung)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.iconCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FundAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
