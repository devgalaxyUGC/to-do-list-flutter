import 'package:dartz/dartz.dart';
import 'package:flutter_my_app/domain/entities/task_entity.dart';

abstract class ITaskLocalDataSource<T extends TaskEntity> {
  Future<TaskEntity> getTask();
}
