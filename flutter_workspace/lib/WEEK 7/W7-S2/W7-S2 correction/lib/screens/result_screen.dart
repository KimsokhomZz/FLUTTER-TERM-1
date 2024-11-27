import 'package:flutter/material.dart';

import '../widgets/app_button.dart';
import '../model/quiz.dart';
import '../model/submission.dart';


Color goodAnswer = Colors.blue[600] as Color;
const Color badAnswer = Colors.pink;

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key,
      required this.onReStart,
      required this.quiz,
      required this.submission});

  final Quiz quiz;
  final Submision submission;

  final void Function() onReStart;

  String get score => submission.score.toString();
  String get nbAmswer => quiz.questions.length.toString();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("You answered $score on $nbAmswer !",
          style : const TextStyle(fontSize: 25, color: Colors.white)),
          const SizedBox(
            height: 30,
          ),
          for (int i = 0; i < quiz.questions.length; i++)
            ResultItem(
                questionIndex: i,
                answer: submission.getAnwerFor(quiz.questions[i]) as Answer,
                ),
          const SizedBox(height: 30),
          AppButton(
            "Restart Quiz",
            onTap: onReStart,
            icon: Icons.restart_alt,
          )
        ],
      ),
    );
  }
}

class ResultItem extends StatelessWidget {
  const ResultItem(
      {required this.questionIndex,
      required this.answer,
      super.key});

  final int questionIndex;
  final Answer answer;

  bool get isCorrectAnswer => answer.isCorrect;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 10, 20, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
            isCorrectAnswer: isCorrectAnswer,
            questionIndex: questionIndex,
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(answer.question.title,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              ...answer.question.possibleAnswers.map((possibleAnswer) => Text(
                    possibleAnswer,
                    style: TextStyle(
                        color: (possibleAnswer == answer.question.goodAnswer)? goodAnswer:badAnswer),
                  )),
            ],
          )
        ],
      ),
    );
  }
}

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier({
    super.key,
    required this.isCorrectAnswer,
    required this.questionIndex,
  });

  final int questionIndex;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex + 1;
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectAnswer? goodAnswer:badAnswer,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        questionNumber.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
