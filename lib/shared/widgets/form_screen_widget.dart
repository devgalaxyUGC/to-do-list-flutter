import 'package:flutter/material.dart';
import 'package:flutter_my_app/data/task_inherited.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key, required this.taskContext});

  final BuildContext taskContext;

  @override
  State<StatefulWidget> createState() => _FormScreen();
}

class _FormScreen extends State<FormScreen> {
  TextEditingController taskNameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(title: const Text('Form page')),
        body: Center(
            child: SingleChildScrollView(
          child: Container(
              width: 300,
              height: 600,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(width: 3)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        controller: taskNameController,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Write a valid task.';
                          }
                          return null;
                        },
                        textAlign: TextAlign.start,
                        decoration: const InputDecoration(
                            isDense: true,
                            hintText: 'Task name',
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder())),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: difficultyController,
                          validator: (value) {
                            if (value!.isEmpty ||
                                int.parse(value) > 5.0 ||
                                int.parse(value) < 1) {
                              return 'Write a valid difficulty';
                            }
                            return null;
                          },
                          textAlign: TextAlign.start,
                          decoration: const InputDecoration(
                              isDense: true,
                              hintText: 'Difficulty',
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder()),
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onChanged: (text) {
                          setState(() {});
                        },
                        keyboardType: TextInputType.url,
                        controller: imageUrlController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Write a valid Url.';
                          }
                          return null;
                        },
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                            isDense: true,
                            hintText: 'Image',
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder()),
                      )),
                  Column(
                    children: [
                      Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.amberAccent),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(imageUrlController.text,
                                  fit: BoxFit.cover,
                                  errorBuilder: (BuildContext buildContext,
                                          Object exception,
                                          StackTrace? stackTrace) =>
                                      Image.asset('assets/images/no_photo.jpg',
                                          fit: BoxFit.cover)))),
                      ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              TaskInherited.of(widget.taskContext).newTask(
                                  taskNameController.text,
                                  difficultyController.text,
                                  imageUrlController.text);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Your task was saved!')));
                              Navigator.pop(context);
                            }
                          },
                          child: const Text('Add!')),
                    ],
                  )
                ],
              )),
        )),
      ),
    );
  }
}
