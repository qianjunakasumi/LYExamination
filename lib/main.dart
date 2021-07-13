import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lyexamination/boot/network.dart' as network;
import 'package:lyexamination/boot/shared_preferences.dart' as prefs;
import 'package:lyexamination/router/root.dart';

void main() async {
  soak();
  WidgetsFlutterBinding.ensureInitialized();
  await prefs.init();
  network.init();
  runApp(LYExaminationApp());
}

class LYExaminationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '龙岩考试',
      initialRoute: '/privacy',
      getPages: routes,
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
