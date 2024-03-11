import 'package:calculator/utils/colors.dart';
import 'package:flutter/material.dart';

class ButtonCalc extends StatelessWidget {
  final double fontSize;
  final String buttonColor;
  final String textColor;
  final String buttonText;
  final double height;
  final double width;
  final VoidCallback onPressed;
  final OutlinedBorder shape;

  const ButtonCalc(
      {super.key,
      required this.buttonText,
      this.fontSize = 30,
      this.buttonColor = ColorsCalc.green,
      this.textColor = ColorsCalc.white,
      this.height = 80,
      this.shape = const CircleBorder(),
      required this.onPressed,
      this.width = 100});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: ColorsCalc.hexToColor(buttonColor),
          shape: shape,
          fixedSize: Size(width, height) // Set the background color to green
          ),
      child: Text(
        buttonText,
        style: TextStyle(
            color: ColorsCalc.hexToColor(textColor), fontSize: fontSize),
      ),
    );
  }
}
