import 'package:flutter_my_app/domain/entities/task_entity.dart';
import 'package:hive/hive.dart';

part 'task_model_hive.g.dart';

@HiveType(typeId: 0)
class TaskModelHive extends TaskEntity {
  @HiveField(0)
  String taskName;

  @HiveField(1)
  int difficulty;

  @HiveField(2)
  String? imgSrc;

  TaskModelHive({required this.taskName, required this.difficulty, this.imgSrc})
      : super(name: taskName, difficulty: difficulty, imgSrc: imgSrc);
}
