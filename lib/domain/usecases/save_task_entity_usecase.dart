import 'package:dartz/dartz.dart';
import 'package:flutter_my_app/domain/entities/task_entity.dart';
import 'package:flutter_my_app/domain/repositories/i_task_repo.dart';

abstract class ISaveTaskEntityUsecase {
  Future<Either<Exception, void>> call({required TaskEntity taskEntity});
}

class SaveTaskEntityUsecaseImpl implements ISaveTaskEntityUsecase {
  final ITaskRepo _taskRepo;
  SaveTaskEntityUsecaseImpl(this._taskRepo);

  @override
  Future<Either<Exception, void>> call({required TaskEntity taskEntity}) async {
    var eitherRepoResp = await _taskRepo.save(taskEntity);

    return eitherRepoResp.fold(
        (Exception exception) => Left(exception), (_) => const Right(null));
  }
}
