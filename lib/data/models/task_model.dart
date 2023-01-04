import 'package:flutter_my_app/domain/entities/task_entity.dart';

extension TaskModel on TaskEntity {
  static int _convertBoolToInt(bool bool) {
    return bool ? 1 : 0;
  }

  static bool _convertIntToBool(int integer) {
    return integer == 1 ? true : false;
  }

  static TaskEntity fromJson(Map<String, dynamic> json) {
    return TaskEntity(
      name: json['task'],
      difficulty: json['difficulty'],
      imgSrc: json['imgSrc'],
      isFinished: _convertIntToBool(
        json['isFinished'],
      ),
    );
  }

  static Map<String, dynamic> toJson(TaskEntity taskEntity) {
    final statusConverted = _convertBoolToInt(taskEntity.isFinished);
    return {
      'task': taskEntity.name,
      'difficulty': taskEntity.difficulty,
      'imgSrc': taskEntity.imgSrc,
      'isFinished': statusConverted
    };
  }
}
