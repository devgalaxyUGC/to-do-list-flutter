import 'package:flutter/material.dart';

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
          primarySwatch: Colors.blue,
        ),
        home: Container(
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(color: Colors.brown, width: 75, height: 75),
                    Container(color: Colors.redAccent, width: 75, height: 75),
                    Container(
                        color: Colors.orangeAccent, width: 75, height: 75),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        color: Colors.yellowAccent, width: 75, height: 75),
                    Container(color: Colors.greenAccent, width: 75, height: 75),
                    Container(color: Colors.blueAccent, width: 75, height: 75),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                        color: Colors.lightBlueAccent, width: 75, height: 75),
                    Container(
                        color: Colors.purpleAccent, width: 75, height: 75),
                    Container(color: Colors.white, width: 75, height: 75),
                  ],
                )
              ],
            )));
  }
}
