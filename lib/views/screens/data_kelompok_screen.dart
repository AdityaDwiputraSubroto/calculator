import 'package:calculator/utils/colors.dart';
import 'package:flutter/material.dart';

class DataKelompokScreen extends StatefulWidget {
  const DataKelompokScreen({super.key});

  @override
  State<DataKelompokScreen> createState() => _DataKelompokScreenState();
}

class _DataKelompokScreenState extends State<DataKelompokScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Data Kelompok',
            style: TextStyle(color: Colors.white),
          ),
          iconTheme:
              IconThemeData(color: ColorsCalc.hexToColor(ColorsCalc.white)),
          backgroundColor: ColorsCalc.hexToColor(ColorsCalc.green),
        ),
        body: Container(
            alignment: Alignment.center,
            child: Column(children: [
              SizedBox(
                height: 200,
              ),
              Text(
                'Anggota Kelompok',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Aditya Dwiputra Subroto / 123210053',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Nuriyatus Sholihah / 123210129',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ])));
  }
}
