import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lyexamination/boot/network.dart' as network;
import 'package:lyexamination/router.dart';

void main() async {
  soak();
  network.init();
  runApp(LYExaminationApp());
}

class LYExaminationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // TODO 读取档案信息，若存在档案 -> initialRoute = '/welcome'
    // TODO              不存在   -> initialRoute = '/privacy'

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
