import 'package:calculator/utils/colors.dart';
import 'package:flutter/material.dart';

class ButtonCalc extends StatelessWidget {
  final double fontSize;
  final String buttonColor;
  final String textColor;
  final String buttonText;
  const ButtonCalc({
    super.key,
    required this.buttonText,
    this.fontSize = 45,
    this.buttonColor = ColorsCalc.green,
    this.textColor = ColorsCalc.white,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Add your onPressed callback function here
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: ColorsCalc.hexToColor(buttonColor),
          shape: CircleBorder() // Set the background color to green
          ),
      child: Text(
        buttonText,
        style: TextStyle(
            color: ColorsCalc.hexToColor(textColor), fontSize: fontSize),
      ),
    );
  }
}
