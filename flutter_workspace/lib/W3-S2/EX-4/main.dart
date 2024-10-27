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
          CustomCard(text: 'OOP', color: Colors.blue[100]),
          CustomCard(text: 'DART', color: Colors.blue[300]),
          CustomCard(text: 'FLUTTER', color: Colors.blue[100]),

          // Container(
          //   margin: const EdgeInsets.symmetric(vertical: 5),
          //   decoration: BoxDecoration(
          //     color: Colors.blue[600],
          //     borderRadius: BorderRadius.circular(40),
          //     gradient: LinearGradient(
          //       colors: [
          //         Colors.blue[300]!,
          //         Colors.blue[800]!,
          //       ],
          //     ),
          //   ),
          //   child: const Center(
          //     child: Text(
          //       'FLUTTER',
          //       style: TextStyle(
          //         fontSize: 30,
          //         color: Colors.white,
          //         decoration: TextDecoration.none,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    ),
  ));
}

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.text, this.color = Colors.blue}): gradientColor = null;
  const CustomCard.gradient({super.key, required this.text, this.gradientColor = [Colors.blue[300], Colors.blue[800]]}): color = null;

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
