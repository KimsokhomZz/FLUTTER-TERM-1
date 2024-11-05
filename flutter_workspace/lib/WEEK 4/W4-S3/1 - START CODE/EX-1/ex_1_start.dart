import 'package:flutter/material.dart';

//Button Widget
class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool _isSelected = false;

  //getters to get the text, text color and background color depending on the state
  String get textLabel => _isSelected ? 'Selected' : 'Not Selected';
  Color get textColor => _isSelected ? Colors.white : Colors.black;
  Color get btnBgColor => _isSelected ? Colors.blue[500]! : Colors.blue[50]!;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
          onPressed: () => {
                setState(() {
                  _isSelected = !_isSelected;
                })
              },
          style: ElevatedButton.styleFrom(
            backgroundColor: btnBgColor,
          ),
          child: Center(
            child: Text(
              textLabel,
              style: TextStyle(color: textColor),
            ),
          )),
    );
  }
}

//Main function
void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: const Center(
          child: Column(
            children: [
              Button(),
              SizedBox(
                height: 10,
              ),
              Button(),
              SizedBox(
                height: 10,
              ),
              Button(),
              SizedBox(
                height: 10,
              ),
              Button(),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    ));
