import 'package:flutter/material.dart';
import 'package:flutter_my_app/presentation/controllers/taks_controller.dart';
import 'package:get_it/get_it.dart';

class TaskPage extends StatelessWidget {
  TaskPage({super.key});

  TaskController taskController = GetIt.I.get<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(24),
        child: Text(taskController.taskEntity.name),
      ),
    );
  }
}
