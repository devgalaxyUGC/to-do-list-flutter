import 'package:flutter_my_app/data/datasources/i_task_datasource.dart';
import 'package:flutter_my_app/domain/entities/task_entity.dart';

class TaskDataSourceImpl implements ITaskDataSource {
  // Falta implementar
  @override
  Future<TaskEntity> getTask() async {
    return await TaskEntity(name: 'name', difficulty: 1, imgSrc: 'imgSrc');
  }

  // Falta implementar
  @override
  Future<void> save(TaskEntity taskModel) async {
    return await null;
  }
}
