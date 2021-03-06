//  Copyright (c) 2022 qianjunakasumi <i@qianjunakasumi.ren>
//                     qianjunakasumi <qianjunakasumi@outlook.com>
//                     [qianjunakasumi] 千橘雫霞(https://github.com/qianjunakasumi)
//
//       This Source Code Form is subject to the terms of the Mozilla Public
//       License, v. 2.0. If a copy of the MPL was not distributed with this
//       file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '/src/boot/pages.dart';
import '/src/boot/theme.dart';
import '/src/data/apis/service.dart';
import '/src/data/hives/roles/roles.dart';
import '/src/data/hives/service.dart';
import '/src/pages/home/controller.dart';
import '/src/services/session.dart';

class LYExaminationApp extends StatelessWidget {
  static Future<LYExaminationApp> run() async {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(appUI);

    await Future.wait([
      Get.putAsync(() => APIService().init()),
      Get.putAsync(() => HiveService().init()),
    ]);
    Get.put(SessionService());
    Get.lazyPut(() => HomeController()..run());

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
      theme: appTheme,
      getPages: pages,
    );
  }
}
