import 'package:flutter/material.dart';
import 'package:flutter_my_app/presentation/controllers/taks_controller.dart';
import 'package:get_it/get_it.dart';

import '../../domain/entities/task_entity.dart';

class TaskPage extends StatelessWidget {
  TaskPage({super.key});

  TaskController taskController = GetIt.I.get<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(24),
        child: TaskProperties(taskController: taskController),
      ),
    );
  }
}

class TaskProperties extends StatelessWidget {
  const TaskProperties({super.key, required this.taskController});

  final TaskController taskController;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: taskController.stream,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          throw snapshot.error!;
        }
        if (snapshot.hasData) {
          return const Text('Teste task entity');
        }
        // return const SizedBox();
        return const CircularProgressIndicator();
      },
    );
  }
}
