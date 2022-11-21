import 'package:flutter/material.dart';
import 'package:flutter_my_app/data/task_inherited.dart';
import 'package:flutter_my_app/shared/widgets/form_screen_widget.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreen();
}

class _InitialScreen extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('To Do List!'), backgroundColor: Colors.amber),
        body: ListView(
            padding: const EdgeInsets.only(top: 8, bottom: 70),
            children: TaskInherited.of(context).listOfTasks),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (contextNew) =>
                          FormScreen(taskContext: context)));
            },
            child: const Icon(Icons.add_box_rounded)));
  }
}
