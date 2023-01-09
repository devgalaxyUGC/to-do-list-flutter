import 'package:dartz/dartz.dart';
import 'package:flutter_my_app/domain/entities/task_entity.dart';

abstract class ITaskRepo {
  /// Método responsável por recuperar uma entidade de tarefas a partir do repositório
  Future<Either<Exception, TaskEntity>> getTaskInfo();

  /// Método responsável por recuperar uma lista com todas as entidades registradas no repositório
  Future<Either<Exception, List<TaskEntity>>> getAllTasks();
}
