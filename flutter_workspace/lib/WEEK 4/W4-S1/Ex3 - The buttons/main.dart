import 'package:flutter/material.dart';

//main funciton
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Custom Buttons'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomButton(
                buttonLabel: 'Submit',
                buttonIcon: Icons.check,
                buttonType: ButtonType.primary),
            SizedBox(
              height: 16,
            ),
            CustomButton(
                buttonLabel: 'Time',
                buttonIcon: Icons.access_time,
                iconPosition: IconAlignment.end,
                buttonType: ButtonType.secondary),
            SizedBox(
              height: 16,
            ),
            CustomButton(
              buttonLabel: 'Account',
              buttonIcon: Icons.account_circle_outlined,
              iconPosition: IconAlignment.end,
              buttonType: ButtonType.disable,
            ),
          ],
        ),
      ),
    ),
  ));
}

//enum that store specific color of button
enum ButtonType { primary, secondary, disable }

//extract widget which represent CustonButton
class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.buttonLabel,
      required this.buttonIcon,
      this.iconPosition = IconAlignment.start,
      this.buttonType = ButtonType.primary});

  //parameters
  final String buttonLabel;
  final IconData buttonIcon;
  final IconAlignment iconPosition;
  final ButtonType buttonType;

  @override
  Widget build(BuildContext context) {
    //my logic to return buttonColor that represent each type of our button
    Color buttonColor;
    switch (buttonType) {
      case ButtonType.primary:
        buttonColor = Colors.blue;
        break;
      case ButtonType.secondary:
        buttonColor = Colors.green;
        break;
      case ButtonType.disable:
        buttonColor = Colors.grey;
        break;
    }
    return ElevatedButton.icon(
      onPressed: buttonType == ButtonType.disable
          ? null
          : () {
              //some logic
            },
      icon: Icon(buttonIcon),
      iconAlignment: iconPosition,
      label: Text(buttonLabel),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        backgroundColor: buttonColor,
        foregroundColor: Colors.blue[900],
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: buttonType == ButtonType.disable
              ? FontWeight.w400
              : FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }
}
