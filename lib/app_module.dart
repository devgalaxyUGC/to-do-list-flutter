import 'package:flutter_my_app/data/datasources/i_task_datasource.dart';
import 'package:flutter_my_app/data/repositories/task_repo_impl.dart';
import 'package:flutter_my_app/domain/repositories/i_task_repo.dart';
import 'package:flutter_my_app/domain/usecases/get_task_entity_usecase.dart';
import 'package:flutter_my_app/domain/usecases/save_task_entity_usecase.dart';
import 'package:flutter_my_app/domain/usecases/update_task_entity.dart';
import 'package:flutter_my_app/external/datasources/task_datasource_impl.dart';
import 'package:flutter_my_app/presentation/controllers/taks_controller.dart';
import 'package:get_it/get_it.dart';

class AppModule {
  static void init() {
    final getIt = GetIt.instance;

    // datasources
    getIt.registerLazySingleton<ITaskDataSource>(() => TaskDataSourceImpl());

    // repositories
    getIt.registerLazySingleton<ITaskRepo>(() => TaskRepoImpl(getIt()));

    // usecases
    getIt.registerLazySingleton<IGetTaskEntityUsecase>(
        () => GetTaskEntityUsecaseImpl(getIt()));

    getIt.registerLazySingleton<ISaveTaskEntityUsecase>(
        () => SaveTaskEntityUsecaseImpl(getIt()));

    getIt.registerLazySingleton<IUpdateTaskEntityUsecase>(
        () => UpdateTaskEntityUsecaseImpl(getIt()));

    // controllers
    getIt.registerFactory<TaskController>(
        () => TaskController(getIt(), getIt()));
  }
}
