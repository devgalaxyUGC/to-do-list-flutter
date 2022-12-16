import 'package:flutter_my_app/data/models/task_model.dart';
import 'package:flutter_my_app/data/models/task_model_hive.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveDatabase {
  HiveDatabase() {
    _init();
  }

  void _init() async {
    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);

    Hive.registerAdapter(TaskModelHiveAdapter());
    await Hive.openBox<TaskModel>('tasksBox');
  }
}

// Should override dispose method here?