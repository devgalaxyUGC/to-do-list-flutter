import 'package:dartz/dartz.dart';
import 'package:flutter_my_app/domain/entities/task_entity.dart';
import 'package:flutter_my_app/domain/usecases/get_task_entity_usecase.dart';
import 'package:flutter_my_app/domain/usecases/save_task_entity_usecase.dart';

class TaskController {
  final IGetTaskEntityUsecase _getTaskEntityUsecase;
  final ISaveTaskEntityUsecase _saveTaskEntityUsecase;

  late TaskEntity taskEntity = TaskEntity(name: 'name', difficulty: 3);

  TaskController(this._getTaskEntityUsecase, this._saveTaskEntityUsecase) {
    getTaskByName('Read');
  }

  getTaskByName(String taskName) async {
    var result = await _getTaskEntityUsecase(taskName);
    return result.fold((Exception exception) => print(exception.toString()),
        (TaskEntity success) => taskEntity = success);
  }

  saveTask(TaskEntity taskEntity) async {}
}
