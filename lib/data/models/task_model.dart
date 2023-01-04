import 'package:flutter_my_app/domain/entities/task_entity.dart';

extension TaskModel on TaskEntity {
  static TaskEntity fromJson(Map json) {
    return TaskEntity(
        name: json['name'],
        difficulty: json['difficulty'],
        imgSrc: json['imgSrc'],
        isFinished: json['isFinished']);
  }

  Map toJson() {
    return {
      'name': name,
      'difficulty': difficulty,
      'imgSrc': imgSrc,
      'isFinished': isFinished
    };
  }
}
