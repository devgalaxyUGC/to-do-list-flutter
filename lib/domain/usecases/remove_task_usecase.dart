import 'package:dartz/dartz.dart';

import '../repositories/i_task_repository.dart';

abstract class IRemoveTaskUsecase {
  Future<Either<Exception, void>> call(String name);
}

class RemoveTaskUsecaseImpl implements IRemoveTaskUsecase {
  RemoveTaskUsecaseImpl(this.taskRepo);

  final ITaskRepo taskRepo;

  @override
  Future<Either<Exception, void>> call(String name) async {
    try {
      await taskRepo.delete(name);
      return const Right(null);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
