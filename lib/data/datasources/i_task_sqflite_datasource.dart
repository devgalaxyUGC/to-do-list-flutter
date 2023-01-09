import 'package:flutter_my_app/domain/entities/task_entity.dart';

abstract class ITaskSqfliteDataSource<T extends TaskEntity> {
  /// Método responsável por recuperar uma entidade de tarefas armazenada no banco de dados
  Future<T> getTask();

  /// Retorna uma lista com todas as tarefas registradas no banco de dados
  Future<List<T>> getAllTasks();
}
