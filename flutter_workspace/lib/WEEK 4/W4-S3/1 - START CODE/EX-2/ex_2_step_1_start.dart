import 'package:flutter/material.dart';

//FavoriteCart Widget
class FavoriteCart extends StatefulWidget {
  const FavoriteCart({super.key});

  @override
  State<FavoriteCart> createState() => _FavoriteCartState();
}

class _FavoriteCartState extends State<FavoriteCart> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      // margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Colors.grey.withOpacity(0.5),
        width: 2,
      ))),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'title',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'description',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _isFavorite = !_isFavorite;
              });
            },
            icon: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isFavorite ? Colors.pink : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

//Main function
void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Favorite cards"),
        ),
        body: const Column(
          children: [
            FavoriteCart(),
            FavoriteCart(),
            FavoriteCart(),
            FavoriteCart(),
            FavoriteCart(),
          ],
        ),
      ),
    ));
