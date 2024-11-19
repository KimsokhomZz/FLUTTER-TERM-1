import 'package:flutter/material.dart';
import 'package:flutter_workspace/WEEK%206/W6-S1/EXERCISE-4/jokes.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(MaterialApp(home: MyApp()));

//MyApp
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int? _favoriteIndex;

  void setFavorite(int index) {
    setState(() {
      _favoriteIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Favorite Jokes"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(jokes.length, (index) {
            return JokeCard(
              title: jokes[index].title,
              description: jokes[index].description,
              isFavorite: _favoriteIndex == index,
              onFavoriteClick: () => setFavorite(index),
            );
          }),
        ),
      ),
    );
  }
}

//Joke Card Widget
class JokeCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isFavorite;
  final VoidCallback onFavoriteClick;

  //constructor
  const JokeCard(
      {super.key,
      required this.title,
      required this.description,
      required this.isFavorite,
      required this.onFavoriteClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                      TextStyle(color: appColor, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                Text(description),
              ],
            ),
          ),
          IconButton(
              onPressed: onFavoriteClick,
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ))
        ],
      ),
    );
  }
}
