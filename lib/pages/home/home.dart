//  Copyright (c) 2022 qianjunakasumi <i@qianjunakasumi.ren>
//                     qianjunakasumi <qianjunakasumi@outlook.com>
//                     [qianjunakasumi] 千橘雫霞(https://github.com/qianjunakasumi)
//
//       This Source Code Form is subject to the terms of the Mozilla Public
//       License, v. 2.0. If a copy of the MPL was not distributed with this
//       file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/pages/home/controller.dart';
import '/services/session.dart';
import '/utils.dart';
import 'achievement/achievement.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout({Key? key}) : super(key: key);

  final HomeController h = Get.find();

  String? status(SessionStatus s) {
    switch (s) {
      case SessionStatus.offline:
        return '正在登录...';
      case SessionStatus.browse:
        return null;
      case SessionStatus.online:
        return null;
      case SessionStatus.failure:
        return '登录错误';
    }
  }

  void tapped(int a) {
    switch (a) {
      case 0:
        break;
      case 1:
        snack('还未完成哦');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final SessionService s = Get.find();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Align(
          alignment: Alignment.centerRight,
          child: Image.asset('assets/images/logo_transparent.png',
              width: 32, height: 32),
        ),
        title: Obx(() => Text(status(s.status()) ?? '龙岩考试')),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        onTap: tapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.grade), label: '考试'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: '我'),
        ],
      ),
      body: HomeAchievementPage(),
    );
  }
}
