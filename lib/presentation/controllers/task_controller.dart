import 'package:flutter/material.dart';
import 'package:flutter_my_app/domain/entities/task_entity.dart';
import 'package:flutter_my_app/domain/usecases/get_task_usecase.dart';

class TaskController {
  TaskController(this._getTaskUsecase) {
    fetch();
  }

  final IGetTaskUsecase _getTaskUsecase;
  final List<TaskEntity> list = [];

  TaskEntity? taskInCache;

  fetch() async {
    final result = await _getTaskUsecase.call();

    result.fold(
        (error) => debugPrint(error.toString()),
        (success) => {
              taskInCache?.name = success.name,
              taskInCache?.difficulty = success.difficulty,
              taskInCache?.imgSrc = success.imgSrc,
              taskInCache?.isFinished = success.isFinished,
              list.add(success)
            });
  }
}
