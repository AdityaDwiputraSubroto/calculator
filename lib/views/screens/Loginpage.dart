import 'package:calculator/utils/colors.dart';
import 'package:calculator/views/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Loginpage extends StatefulWidget {
  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String username = "";
  String password = "";
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: Icon(
          Icons.person,
          color: Colors.grey,
        ),
        backgroundColor: ColorsCalc.hexToColor(ColorsCalc.green),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 100,
            ),
            _usernameFields(),
            _passwordFields(),
            Container(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: Text(
                isError
                    ? (username.isEmpty && password.isEmpty)
                        ? "Username dan password wajib diisi"
                        : (username.isEmpty
                            ? "Username salah"
                            : "Password salah")
                    : "",
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
            _buttonLogin(context),
          ],
        ),
      ),
    );
  }

  Widget _usernameFields() {
    return Container(
      padding: EdgeInsets.all(20),
      child: TextField(
        onChanged: (value) {
          setState(() {
            username = value;
          });
          print("username: " + username);
        },
        decoration: InputDecoration(
          // menggunakan errorText
          errorText: isError ? "username salah" : null,

          labelText: 'Username',
          prefixIcon: Icon(Icons.person), //ikon user

          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.grey), // Set default color to gray
            borderRadius: BorderRadius.circular(10),
          ),

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: const Color.fromARGB(
                    255, 39, 224, 52)), // Set focused color to blue
            borderRadius: BorderRadius.circular(10),
          ),

          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red), // Set error color to red
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Widget _passwordFields() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        obscureText: true,
        onChanged: (value) {
          setState(() {
            password = value;
          });
          print("password: " + password);
        },

        // cara menggunakan enabled Border
        decoration: InputDecoration(
          errorText: isError ? "password salah" : null, // Show error message
          labelText: 'Password',
          prefixIcon: Icon(Icons.lock), // Ikon kunci
          // errorBorder: , styling ketika error
          // focusedBorder: , styling ketika fokus pada fields
          // disabledBorder: , styling untuk border ketika fields disable
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.grey), // Set default color to gray
            borderRadius: BorderRadius.circular(10),
          ),

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: const Color.fromARGB(
                    255, 39, 224, 52)), // Set focused color to blue
            borderRadius: BorderRadius.circular(10),
          ),

          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red), // Set error color to red
            borderRadius: BorderRadius.circular(10),
            //borderSide: BorderSide(color: isError ? Colors.red : Colors.blue),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Widget _buttonLogin(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          // print("login");
          print("username: " + username);
          print("password: " + password);

          setState(() {
            isError = username.isEmpty ||
                password.isEmpty; // Set error based on empty fields
          });

          String text = "Login Sukses";

          if ((username == "nuriya" && password == "123210129") ||
              (username == "aditya" && password == "123210053") ||
              (username == "gendy" && password == "123210017")) {
            setState(() {
              isError = false;
            });
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return HomeScreen();
            }));
          } else {
            setState(() {
              isError = true;
            });
            text = "Login Gagal";
          }

          final SnackBar snackBar = SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text(text),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Text(
          'LOG IN',
          style: TextStyle(
            color: Colors.white, // White text
            fontSize: 16.0,
          ),
        ),
        style: ElevatedButton.styleFrom(
          // Set a smaller size for the button
          minimumSize: Size(100, 40),
          backgroundColor: ColorsCalc.hexToColor(
              ColorsCalc.orange), // Set the button color to yellow
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // Add rounded corners
          ),
        ),
      ),
    );
  }
}
