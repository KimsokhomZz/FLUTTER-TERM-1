import 'package:flutter/material.dart';
import '../model/quiz.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key, required this.onTap, required this.question});

  final Question question;

  final void Function(Question question, String answer) onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Question title
          Align(child: Text(question.title, textAlign:TextAlign.center, style : const TextStyle(fontSize: 25, color: Colors.white),)),
          const SizedBox(height: 30,),
          // Question possible answers
          ...question.possibleAnswers.map((answer) => QuestionButton(
                answer,
                onTap: () => onTap(question, answer),
              )),
        ],
      ),
    );
  }
}

class QuestionButton extends StatelessWidget {
  const QuestionButton(
    this.title, {
    super.key,
    required this.onTap,
  });

  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 40,
          ),
          backgroundColor: Colors.blue[300],
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
