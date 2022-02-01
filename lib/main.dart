//  Copyright (c) 2022 qianjunakasumi <i@qianjunakasumi.ren>
//                     qianjunakasumi <qianjunakasumi@outlook.com>
//                     [qianjunakasumi] 千橘雫霞(https://github.com/qianjunakasumi)
//
//       This Source Code Form is subject to the terms of the Mozilla Public
//       License, v. 2.0. If a copy of the MPL was not distributed with this
//       file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/boot/pages.dart';
import '/boot/theme_light.dart';
import '/boot/theme_night.dart';
import '/data/apis/service.dart';
import '/data/hives/roles/roles.dart';
import '/data/hives/service.dart';
import '/pages/home/controller.dart';
import '/services/session.dart';
import 'services/app_globe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(await LYExaminationApp.run());
}

class LYExaminationApp extends StatelessWidget {
  static Future<LYExaminationApp> run() async {
    await Future.wait([
      Get.putAsync(() => APIService().init()),
      Get.putAsync(() => HiveService().init()),
    ]);
    Get.put(SessionService());
    Get.put(AppGlobeService()).setSystemUI();
    Get.lazyPut(() => HomeController()..run());

    WidgetsBinding.instance!.addObserver(AppWidgetsObserver());

    return !hiveRolesIsEmpty()
        ? const LYExaminationApp()
        : const LYExaminationApp(route: '/welcome/login');
  }

  final String route;

  const LYExaminationApp({this.route = '/home', Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '龙岩考试',
      initialRoute: route,
      theme: lightTheme,
      darkTheme: nightTheme,
      getPages: pages,
    );
  }
}

class AppWidgetsObserver with WidgetsBindingObserver {
  @override
  void didChangePlatformBrightness() {
    final AppGlobeService a = Get.find();
    a.changeTheme();
    Get.forceAppUpdate();
  }
}
