import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lyexamination/router.dart';
import 'package:lyexamination/service/api.dart';

void main() async {
  Get.put(APIService(), tag: 'api');
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
