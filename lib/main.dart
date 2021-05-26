import 'package:flutter/material.dart';
import 'package:lyexamination/common/safety/root_check.dart';
import 'package:lyexamination/home.dart';
import 'package:lyexamination/welcome.dart';

void main() async {
  rootCheck();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(LYExaminationApp());
}

class LYExaminationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '龙岩考试',
      routes: {
        '/': (context) => WelcomePage(),
        '/home': (context) => MyHomePage(),
      },
    );
  }
}
