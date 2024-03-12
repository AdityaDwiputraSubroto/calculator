import 'package:calculator/utils/colors.dart';
import 'package:calculator/views/screens/Loginpage.dart';
import 'package:calculator/views/screens/calculator_screen.dart';
import 'package:calculator/views/screens/data_kelompok_screen.dart';
import 'package:calculator/views/screens/ganjil_genap_screen.dart';
import 'package:calculator/views/widgets/button_calc_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Home',
            style: TextStyle(color: Colors.white),
          ),
          iconTheme:
              IconThemeData(color: ColorsCalc.hexToColor(ColorsCalc.white)),
          backgroundColor: ColorsCalc.hexToColor(ColorsCalc.green),
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(
                  height: 120,
                ),
                Text(
                  'Choose Menu',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 60,
                ),
                ButtonCalc(
                    buttonText: 'Calculator',
                    width: 300,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CalculatorScreen();
                      }));
                    }),
                SizedBox(
                  height: 30,
                ),
                ButtonCalc(
                    buttonText: 'Ganjil / Genap',
                    width: 300,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return GanjilGenapScreen();
                      }));
                    }),
                SizedBox(
                  height: 30,
                ),
                ButtonCalc(
                    buttonText: 'Data Kelompok',
                    width: 300,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DataKelompokScreen();
                      }));
                    }),
                SizedBox(
                  height: 30,
                ),
                ButtonCalc(
                    buttonText: 'Logout',
                    buttonColor: ColorsCalc.orange,
                    width: 300,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80)),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return Loginpage();
                      }));
                    })
              ],
            ),
          ),
        ));
  }
}
