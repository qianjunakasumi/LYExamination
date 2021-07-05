import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lyexamination/router/root.dart';

void main() async {
  soak();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(LYExaminationApp());
}

class LYExaminationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '龙岩考试',
      initialRoute: '/privacy',
      routes: routes,
    );
  }
}

/// 沉浸式状态栏
void soak() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
}
