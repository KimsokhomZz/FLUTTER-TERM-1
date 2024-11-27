import 'quiz.dart';

class Submision {
  final List<Answer> answers = [];

  submitAnswer(Question question, String questionAnswer) {
    Answer? existingAsnwer = getAnwerFor(question);
    if (existingAsnwer != null) {
      // 1- If an  anwer exists, update it
      existingAsnwer.questionAnswer = questionAnswer;
    } else {
      // 2- Otherwise create a new answer
      answers.add(Answer(question: question, questionAnswer: questionAnswer));
    }
  }

  Answer? getAnwerFor(Question question) {
    return answers.where((a) => a.question == question).firstOrNull;
  }

  clearAnswers() {
    answers.clear();
  }

  int get score {
    return answers.fold(0, (score, a) => score + (a.isCorrect ? 1 : 0));
  }
}

class Answer {
  final Question question;
  String questionAnswer;

  Answer({required this.question, required this.questionAnswer});

  bool get isCorrect {
    return question.goodAnswer == questionAnswer;
  }
}
