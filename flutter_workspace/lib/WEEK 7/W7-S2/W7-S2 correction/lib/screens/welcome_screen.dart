import 'package:flutter/material.dart';
import 'package:test1/W6-S1-QUIZ-APP/END-CODE/widgets/app_button.dart';
 
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key, required this.title, required this.onStart});

  final String title;

  final void Function() onStart;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/w5-s2/quiz-logo.png',
          width: 300,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(title, style: const TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold), ),
        ),
        const SizedBox(height: 30,),
        AppButton("Start Quiz", onTap: onStart, icon: Icons.arrow_right_alt,)
      ],
    );
  }
}


