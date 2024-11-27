import 'package:flutter_workspace/WEEK%207/W7-S2/1%20-%20START%20CODE/lib/model/quiz.dart';

class Answer {
  final String questionAnswer;
  final Question question;
  const Answer({required this.questionAnswer, required this.question});

  //goodAnswer??
  bool isCorrect() => question.goodAnswer == questionAnswer;
}

class Submission {
  final Map<Question, Answer> answers;
  const Submission({required this.answers});

  int getScore() {
    int score = 0;
    for (var answer in answers.values) {
      answer.isCorrect() ? score++ : score = score;
    }
    return score;
  }

  Answer? getAnswerFor(Question question) {
    return answers[question];
  }

  void addAnswer(Question question, String answer) {
    answers[question] = Answer(questionAnswer: answer, question: question);
  }

  void removeAnswers() {
    answers.clear();
  }
}


//Q2 – Test the model using a dedicated test file???