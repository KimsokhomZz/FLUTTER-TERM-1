import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      color: Colors.blue[300],
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(30),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.blue[600]),
        child: const Center(
          child: Text(
            'CADT STUDENTS',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
    ),
  ));
}
