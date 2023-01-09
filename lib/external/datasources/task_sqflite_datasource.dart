import 'package:flutter_my_app/data/datasources/i_task_local_datasource.dart';
import 'package:flutter_my_app/data/datasources/i_task_sqflite_datasource.dart';
import 'package:flutter_my_app/data/models/task_model.dart';
import 'package:flutter_my_app/domain/entities/task_entity.dart';
import 'package:flutter_my_app/shared/repositories/sqflite/sqflite_database.dart';
import 'package:flutter_my_app/shared/repositories/sqflite/task_dao.dart';
import 'package:sqflite/sqflite.dart';

class TaskSqfliteDataSource implements ITaskSqfliteDataSource {
  late Database database;

  final taskEntity = TaskEntity(name: 'Drive', difficulty: 5, isFinished: true);

  @override
  Future<TaskEntity> getTask(String task) async {
    try {
      database = await SqfliteDatabase.getDatabaseInstance();
      final TaskDAO taskDao = TaskDAO(database);

      final result = await taskDao.find(task);

      // Dados vão sendo populados no banco de dados. Ou seja, a cada apertada no botão, mais uma linha é inserida
      if (result.length > 46) {
        print('result is empty in datasource');
        print(result.length);
      }
      return result.first;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<TaskEntity>> getAllTasks() async {
    try {
      database = await SqfliteDatabase.getDatabaseInstance();
      final TaskDAO taskDao = TaskDAO(database);

      return await taskDao.findAll();
    } on Exception catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteTask(String name) async {
    try {
      database = await SqfliteDatabase.getDatabaseInstance();
      final TaskDAO taskDao = TaskDAO(database);

      final result = await taskDao.deleteTask(name);
      print('quantidade de linhas deletadas: $result');

      if (result == 1) {
        return;
      } else {
        throw Exception('More than 1 element');
      }
    } on Exception catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> insert(TaskEntity newTask) async {
    try {
      database = await SqfliteDatabase.getDatabaseInstance();
      final TaskDAO taskDao = TaskDAO(database);

      await taskDao.save(newTask);
    } on Exception catch (e) {
      rethrow;
    }
  }
}
