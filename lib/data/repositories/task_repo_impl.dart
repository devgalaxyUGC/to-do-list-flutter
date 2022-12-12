import 'package:flutter_my_app/data/datasources/i_task_datasource.dart';
import 'package:flutter_my_app/domain/entities/task_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_my_app/domain/repositories/i_task_repo.dart';

class TaskRepoImpl implements ITaskRepo {
  final ITaskDataSource _taskDatasource;
  TaskRepoImpl(this._taskDatasource);

  @override
  Future<Either<Exception, TaskEntity>> getTask(String taskName) async {
    try {
      return Right(await _taskDatasource.getTask());
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, void>> save(TaskEntity taskEntity) async {
    try {
      return Right(await _taskDatasource.save(taskEntity));
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
