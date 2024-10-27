import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton(this.label, {required this.start, required this.end, super.key});

  final String label;
  final Color start;
  final Color end;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [start, end],
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.all(40),
      margin: const EdgeInsets.all(10),
      child: Text(label,
          style: const TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
              fontSize: 35)),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyButton("Hello Sokhom", start: Colors.blue, end: Colors.black,),
        MyButton("Hello Vichet", start: Colors.blue, end: Colors.red,),
        MyButton("Hello Vathna", start: Colors.purple, end: Colors.yellow,),
        MyButton("Hello Ah Khun", start: Colors.black, end: Colors.pink,),
        MyButton("Hello Ah Jruk", start: Colors.amber, end: Colors.black,),
      ],
    ),
  ));
}
