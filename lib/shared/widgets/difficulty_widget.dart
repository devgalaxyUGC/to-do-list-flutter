import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  int difficultyLevel = 1;
  Difficulty({
    required this.difficultyLevel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.star,
          color: (difficultyLevel >= 1) ? Colors.amber : Colors.black,
        ),
        Icon(
          Icons.star,
          color: (difficultyLevel >= 2) ? Colors.amber : Colors.black,
        ),
        Icon(
          Icons.star,
          color: (difficultyLevel >= 3) ? Colors.amber : Colors.black,
        ),
        Icon(
          Icons.star,
          color: (difficultyLevel >= 4) ? Colors.amber : Colors.black,
        ),
        Icon(
          Icons.star,
          color: (difficultyLevel >= 5) ? Colors.amber : Colors.black,
        )
      ],
    );
  }
}
