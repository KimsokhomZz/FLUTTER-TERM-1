import 'package:flutter/material.dart';
import 'package:flutter_workspace/WEEK%207/W7-S2/1%20-%20START%20CODE/lib/model/submission.dart';
import 'package:flutter_workspace/WEEK%207/W7-S2/1%20-%20START%20CODE/lib/screens/question_screen.dart';
import 'package:flutter_workspace/WEEK%207/W7-S2/1%20-%20START%20CODE/lib/screens/result_screen.dart';
import 'package:flutter_workspace/WEEK%207/W7-S2/1%20-%20START%20CODE/lib/screens/welcome_screen.dart';
import 'model/quiz.dart';

Color appColor = Colors.blue[500] as Color;

//enum represent 3 screens
enum QuizState { notstarted, started, finished }

class QuizApp extends StatefulWidget {
  final Quiz quiz;
  const QuizApp({super.key, required this.quiz});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  QuizState currentState = QuizState.notstarted;
  final Submission submission = Submission(answers: {});

  //manage screen
  Widget _buildWidgetBasedOnScreen(QuizState currentState) {
    switch (currentState) {
      case QuizState.notstarted:
        return WelcomeScreen(
          quizTitle: 'Crazy Quiz',
          onStart: () {
            setState(() {
              currentState = QuizState.started;
            });
          },
        );
      case QuizState.started:
        return QuestionScreen(
          onTap: () {
            setState(() {
              currentState = QuizState.finished;
            });
          },
          question: widget.quiz.questions,
        );
      case QuizState.finished:
        return ResultScreen(
          onRestart: () {
            setState(() {
              submission.addAnswer(widget.quiz.questions[0], "user's answer");
              currentState = QuizState.notstarted;
            });
          },
          submission: submission,
          quiz: widget.quiz,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: appColor,
        body: Center(
          child: _buildWidgetBasedOnScreen(currentState),
        ),
      ),
    );
  }
}
