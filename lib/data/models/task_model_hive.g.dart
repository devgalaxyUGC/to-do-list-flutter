// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskModelHiveAdapter extends TypeAdapter<TaskModelHive> {
  @override
  final int typeId = 0;

  @override
  TaskModelHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskModelHive(
      taskName: fields[0] as String,
      difficulty: fields[1] as int,
      imgSrc: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TaskModelHive obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.taskName)
      ..writeByte(1)
      ..write(obj.difficulty)
      ..writeByte(2)
      ..write(obj.imgSrc);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskModelHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
