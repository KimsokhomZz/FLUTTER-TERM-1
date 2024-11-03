import 'package:flutter/material.dart';

enum Product {
  dart('Dart', 'the best object language', 'assets/images/dart.png'),
  flutter('Flutter', 'the best widget library', 'assets/images/flutter.png'),
  firebase('Firebase', 'the best cloud database', 'assets/images/firebase.png');

  final String title;
  final String description;
  final String image;

  const Product(this.title, this.description, this.image);
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primaryColor: Colors.white, scaffoldBackgroundColor: Colors.blueAccent,),
    home: Scaffold(
      // backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: const Text('Products'),
        // backgroundColor: Colors.white,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProductCard(
              type: Product.dart,
            ),
            SizedBox(
              height: 8,
            ),
            ProductCard(
              type: Product.flutter,
            ),
            SizedBox(
              height: 8,
            ),
            ProductCard(
              type: Product.firebase,
            ),
            SizedBox(
              height: 8,
            )
          ],
        ),
      ),
    ),
  ));
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.type});

  final Product type;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              type.image,
              height: 80,
              width: 80,
            ),
            Text(
              type.title,
              style: const TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              type.description,
              style: const TextStyle(
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
    );
  }
}
