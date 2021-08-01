import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lyexamination/boot/network.dart' as network;
import 'package:lyexamination/router.dart';

void main() async {
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
