import 'package:flutter/material.dart';

class ImageGallery extends StatefulWidget {
  const ImageGallery({super.key});

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  int _index = 0;
  List<String> images = [
    "assets/images/w4-s2/bird.jpg",
    "assets/images/w4-s2/bird2.jpg",
    "assets/images/w4-s2/insect.jpg",
    "assets/images/w4-s2/girl.jpg",
    "assets/images/w4-s2/man.jpg",
    "assets/images/w4-s2/khun.jpg",
    "assets/images/w4-s2/chet.jpg",
    "assets/images/w4-s2/vath.jpg",
    "assets/images/w4-s2/jruk.jpg",
  ];

  //previous img
  void showPreviousImage() {
    setState(() {
      if (_index > 0) {
        _index--;
      } else {
        _index = images.length - 1;
      }
    });
  }

  //next img
  void showNextImage() {
    setState(() {
      if (_index < images.length - 1) {
        _index++;
      } else {
        _index = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: showPreviousImage,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: showNextImage,
            ),
          ),
        ],
      ),
      body: Image.asset(
        images[_index],
        fit: BoxFit.cover,
      ),
    );
  }
}

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner:
          false, //this line use to HIDE the little DEBUG banner
      home: ImageGallery(),
    ));
