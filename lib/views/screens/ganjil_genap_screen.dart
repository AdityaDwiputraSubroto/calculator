import 'package:calculator/utils/colors.dart';
import 'package:calculator/views/widgets/button_calc_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GanjilGenapScreen extends StatefulWidget {
  const GanjilGenapScreen({super.key});

  @override
  State<GanjilGenapScreen> createState() => _GanjilGenapScreenState();
}

class _GanjilGenapScreenState extends State<GanjilGenapScreen> {
  TextEditingController _calcDisplayController = TextEditingController();
  String number = '0';
  String result = 'Ganjil/Genap';

  @override
  void initState() {
    super.initState();
    _calcDisplayController.text = '0';
  }

  void deleteLastCharacter() {
    setState(() {
      if (number.length <= 1) {
        clearDisplay();
      } else {
        if (number.isNotEmpty) {
          number = number.substring(0, number.length - 1);
        }

        _calcDisplayController.text = '$number';
      }
    });
  }

  void updateDisplay(String text) {
    setState(() {
      number += text;

      _calcDisplayController.text = '$number';
    });
  }

  void clearDisplay() {
    setState(() {
      number = '0';
      _calcDisplayController.text = '0';
    });
  }

  void calculateResult() {
    double num = double.parse(number);
    result = '';

    setState(() {
      if (num % 2 == 0) {
        result = 'Genap';
      } else {
        result = 'Ganjil';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ganjil Genap',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme:
            IconThemeData(color: ColorsCalc.hexToColor(ColorsCalc.white)),
        backgroundColor: ColorsCalc.hexToColor(ColorsCalc.green),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _calcDisplayController,
                readOnly: true,
                style: TextStyle(fontSize: 45),
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(height: 100),
          Container(
            child: Text(
              result,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonCalc(
                buttonText: '7',
                onPressed: () {
                  updateDisplay('7');
                },
              ),
              ButtonCalc(
                buttonText: '8',
                onPressed: () {
                  updateDisplay('8');
                },
              ),
              ButtonCalc(
                buttonText: '9',
                onPressed: () {
                  updateDisplay('9');
                },
              ),
              ButtonCalc(
                buttonText: 'AC',
                buttonColor: ColorsCalc.orange,
                onPressed: () {
                  clearDisplay();
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonCalc(
                buttonText: '4',
                onPressed: () {
                  updateDisplay('4');
                },
              ),
              ButtonCalc(
                buttonText: '5',
                onPressed: () {
                  updateDisplay('5');
                },
              ),
              ButtonCalc(
                buttonText: '6',
                onPressed: () {
                  updateDisplay('6');
                },
              ),
              ButtonCalc(
                buttonText: 'Del',
                buttonColor: ColorsCalc.orange,
                onPressed: () {
                  deleteLastCharacter();
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonCalc(
                buttonText: '1',
                onPressed: () {
                  updateDisplay('1');
                },
              ),
              ButtonCalc(
                buttonText: '2',
                onPressed: () {
                  updateDisplay('2');
                },
              ),
              ButtonCalc(
                buttonText: '3',
                onPressed: () {
                  updateDisplay('3');
                },
              ),
              ButtonCalc(
                buttonText: '=',
                buttonColor: ColorsCalc.orange,
                onPressed: () {
                  if (number != '') {
                    calculateResult();
                  }
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonCalc(
                buttonText: '0',
                width: 380,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80)),
                onPressed: () {
                  updateDisplay('0');
                },
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
