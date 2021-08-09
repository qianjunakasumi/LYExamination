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
  String initialRoute() {
    final HiveService h = Get.find(tag: 'hive');
    if (h.isProfilesEmpty()) {
      return '/create/privacy';
    } else {
      // TODO 请求登录
      print('请求网络服务登录...');
      return '/home';
    }
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
