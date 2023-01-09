import 'package:dartz/dartz.dart';
import 'package:flutter_my_app/domain/entities/task_entity.dart';

import '../repositories/i_task_repository.dart';

abstract class ICreateNewTaskUsecase {
  Future<Either<Exception, void>> call(TaskEntity newTask);
}

class CreateNewTaskUsecaseImpl implements ICreateNewTaskUsecase {
  CreateNewTaskUsecaseImpl(this._taskRepo);

  final ITaskRepo _taskRepo;

  @override
  Future<Either<Exception, void>> call(TaskEntity newTask) async {
    try {
      await _taskRepo.insert(newTask);
      return const Right(null);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
