import 'package:flutter/material.dart';
import 'package:lyexamination/pages/home.dart';
import 'package:lyexamination/pages/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(LYExaminationApp());
}

class LYExaminationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '龙岩考试',
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => WelcomePage(),
        '/home': (context) => MyHomePage(),
      },
    );
  }
}
