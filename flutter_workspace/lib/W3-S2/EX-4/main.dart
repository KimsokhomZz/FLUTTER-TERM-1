// Start from the exercice 3 code

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      color: Colors.grey[50],
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomCard(text: 'OOP', color: Colors.blue[700]),
          CustomCard(text: 'DART', color: Colors.amber),
          CustomCard.gradient(
            text: 'FLUTTER',
          ),
        ],
      ),
    ),
  ));
}

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.text, this.color = Colors.blue})
      : gradientColor = null;
  const CustomCard.gradient(
      {super.key,
      required this.text,
      this.gradientColor = const [
        Color.fromARGB(255, 224, 10, 185),
        Color.fromARGB(255, 0, 0, 0)
      ]})
      : color = null;

  final String text;
  final Color? color;
  final List<Color>? gradientColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: color,
        gradient: gradientColor != null
            ? LinearGradient(colors: gradientColor!)
            : null,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
