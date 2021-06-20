import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lyexamination/pages/create.dart';
import 'package:lyexamination/pages/home.dart';
import 'package:lyexamination/pages/privacy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(LYExaminationApp());
  soak();
}

/// 沉浸式状态栏
void soak() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF000000),
      systemNavigationBarDividerColor: null,
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
}

class LYExaminationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '龙岩考试',
      initialRoute: '/privacy',
      routes: {
        '/privacy': (context) => PrivacyPage(),
        '/home': (context) => MyHomePage(),
        '/create': (context) => CreatePage(),
      },
    );
  }
}
