import 'package:flutter/material.dart';
import 'package:flutter_my_app/app_module.dart';
import 'package:flutter_my_app/data/task_inherited.dart';
import 'package:flutter_my_app/presentation/ui/task_page.dart';
import 'shared/widgets/initial_screen_widget.dart';

void main() {
  // Inicia
  AppModule.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TaskPage());
  }
}
