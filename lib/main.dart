import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool opacity = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: Scaffold(
            appBar: AppBar(
                title: const Text('To Do List!'),
                backgroundColor: Colors.amber),
            body: AnimatedOpacity(
              duration: const Duration(milliseconds: 3000),
              opacity: opacity ? 1 : 0,
              child: ListView(children: const [
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Tasks('Playing an instrument', 5,
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRN3o_cZcXgl3377r9PSBCmffXmFvZ7NvwexIpQJtRmcg&s'),
                ),
                Tasks('Learn Flutter and Dart', 4,
                    'https://cdn-images-1.medium.com/max/1200/1*5-aoK8IBmXve5whBQM90GA.png'),
                Tasks('Watch Youtube videos', 1,
                    'https://cdn-icons-png.flaticon.com/512/1384/1384060.png')
              ]),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    opacity = !opacity;
                  });
                },
                child: const Icon(Icons.remove_red_eye))));
  }
}

class Tasks extends StatefulWidget {
  final String taskName;
  final String imageSource;
  final int difficulty;
  const Tasks(this.taskName, this.difficulty, this.imageSource, {super.key});

  @override
  State<Tasks> createState() => _TaskState();
}

class _TaskState extends State<Tasks> {
  int level = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.black,
            ),
            height: 140,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(4)),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(
                          widget.imageSource,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          child: Text(
                            widget.taskName,
                            style: const TextStyle(
                                fontSize: 20, overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.star,
                              color: (widget.difficulty >= 1)
                                  ? Colors.amber
                                  : Colors.black,
                            ),
                            Icon(
                              Icons.star,
                              color: (widget.difficulty >= 2)
                                  ? Colors.amber
                                  : Colors.black,
                            ),
                            Icon(
                              Icons.star,
                              color: (widget.difficulty >= 3)
                                  ? Colors.amber
                                  : Colors.black,
                            ),
                            Icon(
                              Icons.star,
                              color: (widget.difficulty >= 4)
                                  ? Colors.amber
                                  : Colors.black,
                            ),
                            Icon(
                              Icons.star,
                              color: (widget.difficulty >= 5)
                                  ? Colors.amber
                                  : Colors.black,
                            )
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4)),
                        height: 52,
                        width: 52,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              level++;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Icon(Icons.arrow_drop_up),
                              Text(
                                'UP',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                    ),
                    child: Container(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.orangeAccent,
                        value: level / 10,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Level: $level',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
