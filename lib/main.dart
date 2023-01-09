import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_my_app/app_module.dart';
import 'package:flutter_my_app/data/task_inherited.dart';
import 'package:flutter_my_app/domain/entities/task_entity.dart';
import 'package:flutter_my_app/presentation/controllers/task_controller.dart';
import 'package:get_it/get_it.dart';
import 'shared/widgets/initial_screen_widget.dart';

void main() {
  AppModule.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: HomePageTest());
  }
}

class HomePageTest extends StatelessWidget {
  HomePageTest({super.key});
  final taskControllerStore = GetIt.I.get<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(
            builder: (_) => Text(taskControllerStore.list.length.toString())),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: FloatingActionButton(
          onPressed: () {
            taskControllerStore.recoverAllTasks();
          },
        ),
      ),
    );
  }
}
