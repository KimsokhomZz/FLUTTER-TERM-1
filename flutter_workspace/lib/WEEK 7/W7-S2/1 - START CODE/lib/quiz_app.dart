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
  int currentQuestionIndex = 0;
  final Submission submission = Submission();

  //manage state
  void startQuiz() {
    setState(() {
      currentState = QuizState.started;
      currentQuestionIndex = 0;
      submission.removeAnswers();
    });
  }

  void answerQuestion(String answer) {
    final question = widget.quiz.questions[currentQuestionIndex];
    submission.addAnswer(question, answer);

    if (currentQuestionIndex == widget.quiz.questions.length - 1) {
      setState(() {
        currentState = QuizState.finished;
      });
    } else {
      setState(() {
        currentQuestionIndex++;
      });
    }
  }


  //manage screen
  Widget _buildWidgetBasedOnScreen(QuizState currentState) {
    switch (currentState) {
      case QuizState.notstarted:
        return WelcomeScreen(
          quizTitle: widget.quiz.title,
          onStart: startQuiz,
        );
      case QuizState.started:
        return QuestionScreen(
          onTap: answerQuestion,
          question: widget.quiz.questions[currentQuestionIndex],
        );
      case QuizState.finished:
        return ResultScreen(
          onRestart: startQuiz,
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
