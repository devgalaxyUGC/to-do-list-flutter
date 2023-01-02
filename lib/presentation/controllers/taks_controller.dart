import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_my_app/domain/entities/task_entity.dart';
import 'package:flutter_my_app/domain/usecases/get_task_entity_usecase.dart';
import 'package:flutter_my_app/domain/usecases/save_task_entity_usecase.dart';

class TaskController {
  final IGetTaskEntityUsecase _getTaskEntityUsecase;
  final ISaveTaskEntityUsecase _saveTaskEntityUsecase;

  // late TaskEntity taskEntity;
  final StreamController<TaskEntity> streamController = StreamController();

  TaskController(this._getTaskEntityUsecase, this._saveTaskEntityUsecase) {
    taskByName('Read');
    Future.delayed(const Duration(seconds: 3), () {
      streamController
          .add(TaskEntity(name: 'teste de entidade', difficulty: 0));
    });
  }

  void taskByName(String taskName) async {
    var result = await _getTaskEntityUsecase(taskName);

    return result.fold((Exception exception) => print(exception.toString()),
        (TaskEntity success) => streamController.add(success));
  }

  void close() {
    streamController.close();
  }

  Stream<TaskEntity> get stream => streamController.stream;

  saveTask(TaskEntity taskEntity) async {}
}
