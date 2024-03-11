import 'package:calculator/utils/colors.dart';
import 'package:calculator/views/widgets/button_calc_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  TextEditingController _calcDisplayController = TextEditingController();
  String firstNumber = '';
  String operator = '';
  String secondNumber = '';

  @override
  void initState() {
    super.initState();
    _calcDisplayController.text = '0';
  }

  void deleteLastCharacter() {
    setState(() {
      print('display length : ${_calcDisplayController.text.length}');
      if (firstNumber.length > 1) {
        if (secondNumber.isNotEmpty) {
          secondNumber = secondNumber.substring(0, secondNumber.length - 1);
        } else if (operator.isNotEmpty && secondNumber.isEmpty) {
          operator = '';
        } else if (firstNumber.isNotEmpty &&
            operator.isEmpty &&
            secondNumber.isEmpty) {
          firstNumber = firstNumber.substring(0, firstNumber.length - 1);
        }

        _calcDisplayController.text = '$firstNumber $operator $secondNumber';
      } else if (firstNumber.length == 1) {
        clearDisplay();
      }
    });
  }

  void updateDisplay(String text) {
    setState(() {
      if (text == '+' || text == '-') {
        if (firstNumber.isNotEmpty && secondNumber.isEmpty) {
          operator = text;
        } else if (firstNumber.isEmpty && text == '-') {
          firstNumber = '-';
        }
      } else {
        if (operator.isEmpty) {
          if (text == '.' && firstNumber.contains('.')) {
            //Do nothing, decimal point is already present
          } else {
            if (text == '.' && firstNumber.isEmpty) text = '0' + '.';
            firstNumber += text;
          }
        } else {
          if (text == '.' && secondNumber.contains('.')) {
            //Do nothing, decimal point is already present
          } else {
            if (text == '.' && secondNumber.isEmpty) text = '0' + '.';
            secondNumber += text;
          }
        }
      }
      _calcDisplayController.text = '$firstNumber $operator $secondNumber';
    });
  }

  void clearDisplay() {
    setState(() {
      firstNumber = '';
      operator = '';
      secondNumber = '';
      _calcDisplayController.text = '0';
    });
  }

  void calculateResult() {
    double result = 0;
    double num1 = double.parse(firstNumber);
    double num2 = double.parse(secondNumber);

    switch (operator) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
    }

    setState(() {
      if (result == result.toInt()) {
        _calcDisplayController.text = result.toInt().toString();
      } else {
        _calcDisplayController.text = result.toString();
      }
      firstNumber = _calcDisplayController.text;
      operator = '';
      secondNumber = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculator',
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
          SizedBox(height: 200),
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
                buttonText: '+',
                buttonColor: ColorsCalc.orange,
                onPressed: () {
                  updateDisplay('+');
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonCalc(
                buttonText: '.',
                onPressed: () {
                  updateDisplay('.');
                },
              ),
              ButtonCalc(
                buttonText: '0',
                onPressed: () {
                  updateDisplay('0');
                },
              ),
              ButtonCalc(
                buttonText: '-',
                buttonColor: ColorsCalc.orange,
                onPressed: () {
                  updateDisplay('-');
                },
              ),
              ButtonCalc(
                buttonText: '=',
                buttonColor: ColorsCalc.orange,
                onPressed: () {
                  if (firstNumber != '' && secondNumber != '') {
                    print(
                        'calculate result $firstNumber $operator $secondNumber');
                    calculateResult();
                  }
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
