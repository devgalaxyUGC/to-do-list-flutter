import 'package:flutter_my_app/domain/entities/task_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_my_app/domain/repositories/i_task_repository.dart';

import '../datasources/i_task_local_datasource.dart';

class TaskRepoImpl implements ITaskRepo {
  TaskRepoImpl(this._taskLocalDataSource);
  final ITaskLocalDataSource _taskLocalDataSource;

  @override
  Future<Either<Exception, TaskEntity>> getTaskInfo() async {
    try {
      return Right(await _taskLocalDataSource.getTask());
    } on Exception {
      rethrow;
    }
  }
}
