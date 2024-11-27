import 'package:flutter/material.dart';
import 'package:flutter_workspace/WEEK%207/W7-S2/1%20-%20START%20CODE/lib/widgets/app_button.dart';

class WelcomeScreen extends StatelessWidget {
  final VoidCallback onStart;
  final String quizTitle;
  const WelcomeScreen(
      {super.key, required this.quizTitle, required this.onStart});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          'lib/WEEK 7/W7-S2/1 - START CODE/assets/quiz-logo.png',
          width: 300,
          height: 300,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          quizTitle,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        AppButton(
          icon: Icons.arrow_right_alt_rounded,
          'Start Quiz',
          onTap: onStart,
        ),
      ]),
    );
  }
}
