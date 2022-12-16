import 'package:flutter_my_app/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  String taskName;
  int difficulty;
  String? imgSrc;
  TaskModel({required this.taskName, required this.difficulty, this.imgSrc})
      : super(name: taskName, difficulty: difficulty, imgSrc: imgSrc);

  static TaskModel fromJson(Map<String, dynamic> map) {
    return TaskModel(
        taskName: map['taskName'],
        difficulty: map['difficulty'],
        imgSrc: map['imgSrc']);
  }

  Map toJson() {
    return {'taskName': taskName, 'difficulty': difficulty, 'imgSrc': imgSrc};
  }
}
