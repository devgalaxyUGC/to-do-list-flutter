import 'package:flutter/material.dart';
import 'package:flutter_my_app/data/task_inherited.dart';
import 'shared/widgets/initial_screen_widget.dart';

void main() {
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
        home: TaskInherited(child: const InitialScreen()));
  }
}
