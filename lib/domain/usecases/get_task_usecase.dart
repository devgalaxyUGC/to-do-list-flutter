import 'package:dartz/dartz.dart';
import 'package:flutter_my_app/domain/repositories/i_task_repository.dart';

import '../entities/task_entity.dart';

abstract class IGetTaskUsecase {
  Future<Either<Exception, TaskEntity>> call(String task);
}

class GetTaskUsecaseImpl implements IGetTaskUsecase {
  GetTaskUsecaseImpl(this._taskRepo);

  final ITaskRepo _taskRepo;

  @override
  Future<Either<Exception, TaskEntity>> call(String task) async {
    try {
      final eitherRepoResp = await _taskRepo.getTaskInfo(task);

      return eitherRepoResp.fold(
        (exception) => Left(exception),
        (taskEntity) => Right(taskEntity),
      );
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
