import 'package:flutter_my_app/data/datasources/i_task_datasource.dart';
import 'package:flutter_my_app/data/models/task_model.dart';
import 'package:flutter_my_app/domain/entities/task_entity.dart';

class TaskDataSourceImpl implements ITaskDataSource {
  final jsonTask = {
    'taskName': 'Read a book',
    'difficulty': 1,
    'imgSrc': 'imgSrc'
  };
  @override
  Future<TaskModel> getTask(String taskName) async {
    try {
      if (taskName == 'Read') {
        return TaskModel.fromJson(jsonTask);
      }
      return TaskModel(
          taskName: 'Nao encontrado', difficulty: 2, imgSrc: 'source');
    } on Exception catch (e) {
      rethrow;
    }
  }

  // Falta implementar
  @override
  Future<void> save(TaskEntity taskModel) async {
    return await null;
  }
}
