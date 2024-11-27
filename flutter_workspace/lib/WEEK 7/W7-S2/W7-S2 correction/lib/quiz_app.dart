import 'package:flutter/material.dart';
import 'package:test1/W6-S1-QUIZ-APP/END-CODE/model/submission.dart';
import 'model/quiz.dart';
import 'screens/result_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/question_screen.dart';

Color appColor = Colors.blue[500] as Color;

enum QuizState { notStarted, started, finished }

class QuizApp extends StatefulWidget {
  const QuizApp(this.quiz, {super.key});

  final Quiz quiz;

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  // Question quiz state
  QuizState quizState = QuizState.notStarted;

  // Current question index
  int questionIndex = 0;

  // Current question
  Question get currentQuestion => widget.quiz.questions[questionIndex];

// Quiz submission
  final Submision submission = Submision();

  Widget get currentScreen {
    return switch (quizState) {
      QuizState.notStarted =>
        WelcomeScreen(title: widget.quiz.title, onStart: start),
      QuizState.started =>
        QuestionScreen(question: currentQuestion, onTap: onQuestionTap),
      QuizState.finished => ResultScreen(
          onReStart: restart,
          submission: submission,
          quiz: widget.quiz,
        ),
    };
  }

  void onQuestionTap(Question question, String answer) {
    // Save the asnwer
    submission.submitAnswer(question, answer);

    if (questionIndex == widget.quiz.questions.length - 1) {
      // Finish the quiz
      finish();
    } else {
      // Go to next question
      setState(() => questionIndex++);
    }
  }

  void start() => _setQuizState(QuizState.started);
  void finish() => _setQuizState(QuizState.finished);

  void restart() {
    setState(() {

      // 1 - Clear the asnwers
      submission.clearAnswers();

      // 2 - Set index to 0
      questionIndex = 0;

      // 3 - Switch to welcome
      quizState = QuizState.notStarted;
    });
  }

  void _setQuizState(QuizState newState) {
    setState(() => quizState = newState);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: appColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              currentScreen,
            ],
          ),
        ),
      ),
    );
  }
}
