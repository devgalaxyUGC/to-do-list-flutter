import 'package:flutter_my_app/shared/repositories/sqflite/task_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqfliteDatabase {
  static Future<Database> getDatabaseInstance() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'tasks.db');

    return openDatabase(path, onCreate: (db, version) {
      db.execute(TaskDAO.createTable);
    }, version: 1);
  }
}
