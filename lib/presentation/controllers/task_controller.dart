import 'package:flutter/material.dart';
import 'package:flutter_my_app/domain/entities/task_entity.dart';
import 'package:flutter_my_app/domain/usecases/get_task_usecase.dart';
import 'package:mobx/mobx.dart';

part 'task_controller.g.dart';

class TaskController = _TaskController with _$TaskController;

abstract class _TaskController with Store {
  _TaskController(this._getTaskUsecase) {
    // fetch();
  }

  final IGetTaskUsecase _getTaskUsecase;

  @observable
  var list = ObservableList<TaskEntity>();

  TaskEntity? taskInCache;

  // @action
  // fetch() async {
  //   final result = await _getTaskUsecase.call();

  //   result.fold(
  //     (error) => debugPrint(error.toString()),
  //     (success) => {
  //       taskInCache?.name = success.name,
  //       taskInCache?.difficulty = success.difficulty,
  //       taskInCache?.imgSrc = success.imgSrc,
  //       taskInCache?.isFinished = success.isFinished,
  //       list.add(success),
  //       for (int i = 0; i < list.length; i++) {print(list.elementAt(i).name)}
  //     },
  //   );
  // }

  @action
  fetch() async {
    final result = await _getTaskUsecase.call();

    result.fold(
        (error) => error,
        (taskRecovered) => {
              list.add(taskRecovered),
              for (int i = 0; i < list.length; i++)
                {print(list.elementAt(i).name)}
            });
  }
}
