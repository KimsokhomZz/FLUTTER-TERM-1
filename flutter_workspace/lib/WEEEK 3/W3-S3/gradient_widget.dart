import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton(this.label,
      {required this.start,
      required this.end,
      required this.fontSizeInput,
      super.key});

  final String label;
  final Color start;
  final Color end;
  final double fontSizeInput;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [start, end],
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.all(10),
      child: Text(label,
          style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
              fontSize: fontSizeInput)),
    );
  }
}