import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      color: Colors.grey[50],
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(40),
            ),
            child: const Center(
              child: Text(
                'OOP',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: Colors.blue[300],
              borderRadius: BorderRadius.circular(40),
            ),
            child: const Center(
              child: Text(
                'DART',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: Colors.blue[600],
              borderRadius: BorderRadius.circular(40),
              gradient: LinearGradient(
                colors: [
                  Colors.blue[300]!,
                  Colors.blue[800]!,
                ],
              ),
            ),
            child: const Center(
              child: Text(
                'FLUTTER',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ));
}
