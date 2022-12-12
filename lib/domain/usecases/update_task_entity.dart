import 'package:dartz/dartz.dart';
import 'package:flutter_my_app/domain/repositories/i_task_repo.dart';

import '../entities/task_entity.dart';

abstract class IUpdateTaskEntityUsecase {
  Future<Either<Exception, void>> call(
      {required String taskName, int? difficulty, String? imgSrc});
}

class UpdateTaskEntityUsecaseImpl implements IUpdateTaskEntityUsecase {
  final ITaskRepo _taskRepo;
  UpdateTaskEntityUsecaseImpl(this._taskRepo);

  @override
  Future<Either<Exception, void>> call(
      {required String taskName, int? difficulty, String? imgSrc}) async {
    var repoResp = await _taskRepo.getTask(taskName);

    return repoResp.fold((Exception exception) => Left(exception),
        (TaskEntity taskEntity) async {
      taskEntity.name = taskName;
      if (difficulty != null) {
        taskEntity.difficulty = difficulty;
      }
      if (imgSrc != null) {
        taskEntity.imgSrc = imgSrc;
      }
      var respSaveTask = await _taskRepo.save(taskEntity);
      return respSaveTask.fold(
          (error) => Left(error), (_) => const Right(null));
    });
  }
}
