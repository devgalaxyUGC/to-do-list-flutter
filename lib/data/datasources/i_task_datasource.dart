import 'package:dartz/dartz.dart';
import 'package:flutter_my_app/data/models/task_model.dart';
import 'package:flutter_my_app/domain/entities/task_entity.dart';

abstract class ITaskDataSource<T extends TaskEntity> {
  Future<void> save(T taskModel);

  Future<T> getTask(String taskName);
}
