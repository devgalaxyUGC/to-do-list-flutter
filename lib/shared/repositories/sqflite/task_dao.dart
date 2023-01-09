import 'package:flutter_my_app/data/models/task_model.dart';
import 'package:flutter_my_app/domain/entities/task_entity.dart';
import 'package:flutter_my_app/shared/repositories/sqflite/sqflite_database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDAO {
  static const String createTable =
      'CREATE TABLE $_tableName ( $_name TEXT, $_difficulty INTEGER, $_imgSrc TEXT, $_isFinished INTEGER)';

  static const String _tableName = 'tasksTable';
  static const String _name = 'task';
  static const String _difficulty = 'difficulty';
  static const String _imgSrc = 'imgSrc';
  static const String _isFinished = 'isFinished';

  final Database database;
  const TaskDAO(this.database);

  Future<List<TaskEntity>> findAll() async {
    final Database database = await SqfliteDatabase.getDatabaseInstance();

    final List<Map<String, dynamic>> data = await database.query(_tableName);
    return _dataList(data);
  }

  Future<List<TaskEntity>> find(String taskName) async {
    final Database database = await SqfliteDatabase.getDatabaseInstance();
    final List<Map<String, dynamic>> data = await database
        .query(_tableName, where: '$_name = ?', whereArgs: [taskName]);
    return _dataList(data);
  }

  /// Method to insert tasks
  Future<void> save(TaskEntity taskEntity) async {
    final data = TaskModel.toJson(taskEntity);
    final Database database = await SqfliteDatabase.getDatabaseInstance();
    database.insert(_tableName, data);
  }

  Future<void> deleteAll() async {
    final Database database = await SqfliteDatabase.getDatabaseInstance();
    database.delete(_tableName);
  }

  Future<int> deleteTask(String name) async {
    final Database database = await SqfliteDatabase.getDatabaseInstance();
    return database.delete(_tableName, where: '$_name = ?', whereArgs: [name]);
  }

  List<TaskEntity> _dataList(List<Map<String, dynamic>> dataList) {
    List<TaskEntity> listOfTasks = [];
    for (Map<String, dynamic> line in dataList) {
      final taskRecovered = TaskModel.fromJson(line);
      listOfTasks.add(taskRecovered);
    }
    return listOfTasks;
  }
}
