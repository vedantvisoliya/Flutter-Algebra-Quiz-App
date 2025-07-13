// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equation_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EquationModelAdapter extends TypeAdapter<EquationModel> {
  @override
  final int typeId = 0;

  @override
  EquationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EquationModel(
      id: fields[0] as int,
      equation: fields[1] as String,
      solution: fields[2] as dynamic,
      solved: fields[3] as bool,
      steps: (fields[4] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, EquationModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.equation)
      ..writeByte(2)
      ..write(obj.solution)
      ..writeByte(3)
      ..write(obj.solved)
      ..writeByte(4)
      ..write(obj.steps);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EquationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
