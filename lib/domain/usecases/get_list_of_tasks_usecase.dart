import 'package:dartz/dartz.dart';
import 'package:flutter_my_app/domain/entities/task_entity.dart';
import 'package:flutter_my_app/domain/repositories/i_task_repository.dart';

abstract class IGetListOfTasksUsecase {
  Future<Either<Exception, List<TaskEntity>>> call();
}

class GetListOfTasksUsecaseImpl implements IGetListOfTasksUsecase {
  GetListOfTasksUsecaseImpl(this._taskRepo);
  final ITaskRepo _taskRepo;

  @override
  Future<Either<Exception, List<TaskEntity>>> call() async {
    final eitheRepoResp = await _taskRepo.getAllTasks();

    return eitheRepoResp.fold((error) => Left(error), (list) => Right(list));
  }
}
