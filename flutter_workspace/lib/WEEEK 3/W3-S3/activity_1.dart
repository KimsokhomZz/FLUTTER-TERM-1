import 'package:flutter/material.dart';
import 'package:flutter_workspace/WEEEK%203/W3-S3/gradient_widget.dart';

void main() {
  runApp(const MaterialApp(
    home: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyButton(
          "Hello Sokhom",
          start: Colors.blue,
          end: Colors.black,
          fontSizeInput: 25,
        ),
        MyButton(
          "Hello Vichet",
          start: Colors.blue,
          end: Colors.red,
          fontSizeInput: 25,
        ),
        MyButton(
          "Hello Vathna",
          start: Colors.purple,
          end: Colors.yellow,
          fontSizeInput: 25,
        ),
        MyButton(
          "Hello Ah Khun",
          start: Colors.black,
          end: Colors.pink,
          fontSizeInput: 25,
        ),
        MyButton(
          "Hello Ah Jruk",
          start: Colors.amber,
          end: Colors.black,
          fontSizeInput: 25,
        ),
      ],
    ),
  ));
}
