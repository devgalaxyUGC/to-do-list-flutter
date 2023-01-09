import 'package:flutter_my_app/domain/entities/task_entity.dart';

abstract class ITaskSqfliteDataSource<T extends TaskEntity> {
  /// Método responsável por recuperar uma entidade de tarefas armazenada no banco de dados
  Future<T> getTask(String task);

  /// Retorna uma lista com todas as tarefas registradas no banco de dados
  Future<List<T>> getAllTasks();

  /// Remove uma tarefa registrada no banco de dados baseado no nome
  Future<void> deleteTask(String name);

  // Cria uma nova tarefa no banco de dados
  Future<void> insert(TaskEntity taskEntity);
}
