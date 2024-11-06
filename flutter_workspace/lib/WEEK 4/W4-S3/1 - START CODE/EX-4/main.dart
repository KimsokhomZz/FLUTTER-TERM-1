import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProgreeBar extends StatefulWidget {
  const ProgreeBar({super.key, required this.progressTitle});

  final String progressTitle;

  @override
  State<ProgreeBar> createState() => _ProgreeBarState();
}

class _ProgreeBarState extends State<ProgreeBar> {
  List<Color> colorList = [
    Colors.green[300]!,
    Colors.green,
    Colors.green[700]!,
  ];

  double _progress = 0;
  final double _maxProgess = 300;

  double increaseProgress() {
    if (_progress < _maxProgess) {
      _progress += 30;
    } else {
      _progress = _maxProgess;
    }
    return _progress;
  }

  double decreaseProgress() {
    if (_progress > 0) {
      _progress -= 30;
    } else {
      _progress = _progress;
    }
    return _progress;
  }

  Color progressColor() {
    if (_progress <= 90) {
      return colorList[0];
    } else if (_progress > 90 && _progress <= 210) {
      return colorList[1];
    } else {
      return colorList[2];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'My Score in ${widget.progressTitle}',
            style: TextStyle(
              color: Colors.grey[400],
              fontWeight: FontWeight.w600,
              height: 1,
              fontSize: 25,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    decreaseProgress();
                  });
                },
                tooltip: 'Click to decrease the score',
              ),
              const SizedBox(
                width: 15,
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    increaseProgress();
                  });
                },
                tooltip: 'Click to add the score',
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: _maxProgess,
            child: LinearPercentIndicator(
              lineHeight: 50,
              percent: _progress / _maxProgess,
              // backgroundColor: Colors.grey,
              progressColor: progressColor(),
              animation: false,
              barRadius: const Radius.circular(15),
              center: Text(
                "${(_progress / _maxProgess * 100).toStringAsFixed(0)}%",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//Main Function
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      scaffoldBackgroundColor: Colors.lightGreenAccent,
      primaryColor: Colors.white,
    ),
    home: const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          children: [
            ProgreeBar(progressTitle: 'Flutter'),
            SizedBox(
              height: 20,
            ),
            ProgreeBar(progressTitle: 'Dart'),
            SizedBox(
              height: 20,
            ),
            ProgreeBar(progressTitle: 'React'),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ),
  ));
}
