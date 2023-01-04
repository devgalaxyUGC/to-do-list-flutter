import 'package:flutter_my_app/domain/entities/task_entity.dart';

abstract class ITaskSqfliteDataSource<T extends TaskEntity> {
  Future<T> getTask();
}
