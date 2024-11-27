import 'package:flutter/material.dart';
import 'package:flutter_workspace/WEEK%207/W7-S2/1%20-%20START%20CODE/lib/model/quiz.dart';

class QuestionScreen extends StatelessWidget {
  final void Function(String) onTap;
  final Question question;
  const QuestionScreen(
      {super.key, required this.onTap, required this.question});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          question.title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        ...question.possibleAnswers.map((answer) => ElevatedButton(
          onPressed: () => onTap(answer),
          child: Text(answer),
        ))
      ],
    );
  }
}
