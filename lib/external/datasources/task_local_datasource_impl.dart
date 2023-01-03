import 'package:dartz/dartz.dart';
import 'package:flutter_my_app/data/datasources/i_task_local_datasource.dart';
import 'package:flutter_my_app/data/models/task_model.dart';
import 'package:flutter_my_app/domain/entities/task_entity.dart';

class TaskLocalDataSourceImpl implements ITaskLocalDataSource {
  final json = {'name': 'Read', 'difficulty': 1, 'imgSrc': 'src'};

  @override
  Future<TaskEntity> getTask() async {
    return TaskModel.fromJson(json);
  }
}
