import 'package:flutter/material.dart';
import 'package:flutter_my_app/shared/widgets/tasks_widget.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({Key? key, required Widget child})
      : super(key: key, child: child);

  final List<Tasks> listOfTasks = [
    Tasks('Learning an instrument', 5, 'assets/images/playing_guitar.jpg'),
    Tasks('Flutter and Dart', 4, 'assets/images/flutter_icon.png'),
    Tasks('Courses on Youtube', 1, 'assets/images/youtube_icon.jpg'),
  ];

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No found in context');
    return result!;
  }

  void newTask(String taskName, String difficulty, String imageSrc) {
    listOfTasks.add(Tasks(taskName, int.parse(difficulty), imageSrc));
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.listOfTasks.length != listOfTasks.length;
  }
}
