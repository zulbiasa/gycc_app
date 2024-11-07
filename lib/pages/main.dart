import 'package:flutter/material.dart';
import 'loginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Golden Years Care Connect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFB0C4DE), // Set your primary color here
        scaffoldBackgroundColor: Colors.white, // Set the background color
      ),
      home: LoginPage(),
    );
  }
}

