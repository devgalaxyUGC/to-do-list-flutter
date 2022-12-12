import 'package:dartz/dartz.dart';

import '../entities/task_entity.dart';

abstract class ITaskRepo {
  /// Responsável por recuperar uma entidade do repositório
  Future<Either<Exception, TaskEntity>> getTask(String taskName);

  /// Salva uma nova entidade no repositório local
  Future<Either<Exception, void>> save(TaskEntity taskEntity);
}
