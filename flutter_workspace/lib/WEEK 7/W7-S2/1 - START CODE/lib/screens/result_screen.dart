import 'package:flutter/material.dart';
import 'package:flutter_workspace/WEEK%207/W7-S2/1%20-%20START%20CODE/lib/model/quiz.dart';
import 'package:flutter_workspace/WEEK%207/W7-S2/1%20-%20START%20CODE/lib/model/submission.dart';

class ResultScreen extends StatelessWidget {
  final VoidCallback onRestart;
  final Submission submission;
  final Quiz quiz;
  const ResultScreen(
      {super.key,
      required this.onRestart,
      required this.submission,
      required this.quiz});

  @override
  Widget build(BuildContext context) {
    return const Text("Result Screen");
  }
}
