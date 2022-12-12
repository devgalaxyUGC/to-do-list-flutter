import 'package:dartz/dartz.dart';
import 'package:flutter_my_app/domain/entities/task_entity.dart';
import 'package:flutter_my_app/domain/repositories/i_task_repo.dart';

abstract class IGetTaskEntityUsecase {
  Future<Either<Exception, TaskEntity>> call(String taskName);
}

class GetTaskEntityUsecaseImpl implements IGetTaskEntityUsecase {
  final ITaskRepo _taskRepo;
  GetTaskEntityUsecaseImpl(this._taskRepo);

  // Possivelmente, seria interessante aplicar uma forma de formatação da busca dessa tarefa
  // uma vez que pode haver espaços antes e depois ou até entre toda a String aplicada. Além
  // disso, pode ser interessante também de aplicar mais validações para os valores retornados
  // do repositório e com a busca feita
  @override
  Future<Either<Exception, TaskEntity>> call(String taskName) async {
    var eitherRepoResp = await _taskRepo.getTask(taskName);

    return eitherRepoResp.fold((Exception exception) => Left(exception),
        (TaskEntity taskEntity) {
      if (!(taskEntity.name.toLowerCase() == taskName.toLowerCase())) {
        throw Exception('Task not found!');
      }
      return Right(taskEntity);
    });
  }
}
