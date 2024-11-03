import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: const Text("My Hobbies"),
        backgroundColor: Colors.amber,
      ),
      body: const Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HobbyCard(
              text: 'Travelling',
              iconData: Icons.travel_explore,
              color: Colors.green,
            ),
            HobbyCard(
              text: 'Skating',
              iconData: Icons.skateboarding,
              color: Colors.grey,
            ),
            HobbyCard(
              text: 'Bowling',
              iconData: Icons.blur_circular_outlined,
            ),
            HobbyCard(
              text: 'Music',
              iconData: Icons.music_note_rounded,
              color: Colors.pink,
            ),
            HobbyCard(
              text: 'Gym',
              iconData: Icons.sports_gymnastics,
              color: Colors.yellow,
            ),
          ],
        ),
      ),
    ),
  ));
}

class HobbyCard extends StatelessWidget {
  const HobbyCard(
      {super.key,
      required this.text,
      required this.iconData,
      this.color = Colors.blue});
  final String text;
  final IconData iconData;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 20),
              child: Icon(
                iconData,
                color: Colors.white,
              ),
            ),
            Text(
              text,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
