import 'package:flutter/material.dart';
import 'package:flutter_my_app/shared/widgets/form_screen_widget.dart';
import 'package:flutter_my_app/shared/widgets/tasks_widget.dart';

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
        body: ListView(children: const [
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: Tasks(
                'Playing an instrument', 5, 'assets/images/playing_guitar.jpg'),
          ),
          Tasks('Learn Flutter and Dart', 4, 'assets/images/flutter_icon.png'),
          Tasks('Watch Youtube videos', 1, 'assets/images/youtube_icon.jpg')
        ]),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const FormScreen()));
            },
            child: const Icon(Icons.add_box_rounded)));
  }
}
