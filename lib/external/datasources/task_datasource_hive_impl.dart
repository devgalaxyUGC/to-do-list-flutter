import 'package:flutter_my_app/data/datasources/i_task_datasource.dart';
import 'package:flutter_my_app/data/models/task_model.dart';
import 'package:flutter_my_app/domain/entities/task_entity.dart';
import 'package:hive/hive.dart';

class TaskDataSourceHiveImpl implements ITaskDataSource {
  TaskDataSourceHiveImpl(this.tasksBox);
  // Implementação que precisa ser "envelopada" em um Future, de acordo com a documentação
  // da classe Box
  final Future<Box<TaskModel>> tasksBox;

  @override
  Future<TaskEntity> getTask(String taskName) async {
    return TaskEntity(name: 'name', difficulty: 1);
  }

  @override
  Future<void> save(TaskEntity taskModel) async {
    await Hive.box('tasksBox').add(taskModel);
  }
}
