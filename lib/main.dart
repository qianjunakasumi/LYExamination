import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lyexamination/router.dart';
import 'package:lyexamination/service/api.dart';
import 'package:lyexamination/service/hive.dart';

void main() async {
  Get.put(APIService(), tag: 'api');
  await Get.putAsync(() => HiveService().init(), tag: 'hive');
  runApp(LYExaminationApp());
}

class LYExaminationApp extends StatelessWidget {
  final HiveService h = Get.find(tag: 'hive');

  String initialRoute() {
    if (h.isProfilesEmpty()) {
      return '/create/privacy';
    }
    return '/progress/login';
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '龙岩考试',
      initialRoute: initialRoute(),
      getPages: routes,
    );
  }
}
