import 'package:flutter/material.dart';
import 'package:lyexamination/home.dart';
import 'package:lyexamination/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '龙岩考试',
      routes: {
        '/': (context) => MyHomePage(),
        '/welcome': (context) => WelcomePage(),
      },
    );
  }
}
