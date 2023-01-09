import 'package:flutter/material.dart';
import 'package:flutter_my_app/domain/entities/task_entity.dart';
import 'package:flutter_my_app/domain/usecases/create_task_usecase.dart';
import 'package:flutter_my_app/domain/usecases/get_list_of_tasks_usecase.dart';
import 'package:flutter_my_app/domain/usecases/get_task_usecase.dart';
import 'package:flutter_my_app/domain/usecases/remove_task_usecase.dart';
import 'package:mobx/mobx.dart';

part 'task_controller.g.dart';

class TaskController = _TaskController with _$TaskController;

abstract class _TaskController with Store {
  _TaskController(this._getTaskUsecase, this._getAllTasksUsecase,
      this._removeTaskUsecase, this._createNewTaskUsecase);

  final IGetTaskUsecase _getTaskUsecase;
  final IGetListOfTasksUsecase _getAllTasksUsecase;
  final IRemoveTaskUsecase _removeTaskUsecase;
  final ICreateNewTaskUsecase _createNewTaskUsecase;

  @observable
  var list = ObservableList<TaskEntity>();

  @observable
  var listOfTasks = ObservableList<TaskEntity>();

  TaskEntity? taskInCache;

  @action
  fetch(String task) async {
    final result = await _getTaskUsecase.call(task);

    result.fold(
        (error) => error,
        (taskRecovered) => {
              list.add(taskRecovered),
              for (int i = 0; i < list.length; i++)
                {print(list.elementAt(i).name)}
            });
  }

  @action
  recoverAllTasks() async {
    try {
      final listFromUsecase = await _getAllTasksUsecase.call();

      listFromUsecase.fold(
        (error) => error,
        (populatedList) => {
          listOfTasks = populatedList.toList().asObservable(),
          print(listOfTasks)
        },
      );
    } on Exception catch (e) {
      rethrow;
    }
  }

  @action
  deleteNamedTask(String name) async {
    try {
      await _removeTaskUsecase(name);
      recoverAllTasks();
    } on Exception {
      print('Não deu certo');
    }
  }

  createTask(
      {required String name,
      required int difficulty,
      required bool isFinished}) async {
    try {
      final newTask = TaskEntity(
          name: name, difficulty: difficulty, isFinished: isFinished);
      await _createNewTaskUsecase(newTask);
      fetch(newTask.name);
    } on Exception {
      print('Não deu certo');
    }
  }
}
