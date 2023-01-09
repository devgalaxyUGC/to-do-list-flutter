import 'package:flutter_my_app/data/datasources/i_task_local_datasource.dart';
import 'package:flutter_my_app/data/datasources/i_task_sqflite_datasource.dart';
import 'package:flutter_my_app/data/repositories/task_repo_impl.dart';
import 'package:flutter_my_app/domain/repositories/i_task_repository.dart';
import 'package:flutter_my_app/domain/usecases/get_list_of_tasks_usecase.dart';
import 'package:flutter_my_app/domain/usecases/get_task_usecase.dart';
import 'package:flutter_my_app/external/datasources/task_local_datasource_impl.dart';
import 'package:flutter_my_app/external/datasources/task_sqflite_datasource.dart';
import 'package:flutter_my_app/presentation/controllers/task_controller.dart';
import 'package:get_it/get_it.dart';

class AppModule {
  static void init() {
    final getIt = GetIt.instance;

    // datasources
    getIt.registerLazySingleton<ITaskLocalDataSource>(
        () => TaskLocalDataSourceImpl());
    getIt.registerLazySingleton<ITaskSqfliteDataSource>(
        () => TaskSqfliteDataSource());

    // repositories
    getIt.registerLazySingleton<ITaskRepo>(() => TaskRepoImpl(getIt()));
    // usecases
    getIt.registerLazySingleton<IGetTaskUsecase>(
        () => GetTaskUsecaseImpl(getIt()));

    getIt.registerLazySingleton<IGetListOfTasksUsecase>(
        () => GetListOfTasksUsecaseImpl(getIt()));
        
    // controllers
    getIt.registerFactory<TaskController>(
        () => TaskController(getIt(), getIt()));
  }
}
