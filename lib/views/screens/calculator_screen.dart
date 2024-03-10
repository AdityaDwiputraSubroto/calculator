import 'package:calculator/utils/colors.dart';
import 'package:calculator/views/widgets/button_calc_widget.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Calculator',
            style: TextStyle(color: ColorsCalc.hexToColor(ColorsCalc.white)),
          ),
          backgroundColor: ColorsCalc.hexToColor(ColorsCalc.green),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ButtonCalc(buttonText: '1'),
                  ButtonCalc(buttonText: '2'),
                  ButtonCalc(buttonText: '3'),
                  ButtonCalc(buttonText: '4'),
                ],
              ),
            )
          ],
        ));
  }
}
