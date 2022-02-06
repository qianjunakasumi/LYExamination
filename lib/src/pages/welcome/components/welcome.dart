//  Copyright (c) 2022 qianjunakasumi <i@qianjunakasumi.ren>
//                     qianjunakasumi <qianjunakasumi@outlook.com>
//                     [qianjunakasumi] 千橘雫霞(https://github.com/qianjunakasumi)
//
//       This Source Code Form is subject to the terms of the Mozilla Public
//       License, v. 2.0. If a copy of the MPL was not distributed with this
//       file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/src/services/app_globe.dart';

const welcomeComponentHeroName = 'WelcomeComponent';

class WelcomeComponent extends StatelessWidget {
  WelcomeComponent({Key? key}) : super(key: key);

  final AppGlobeService a = Get.find();

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: welcomeComponentHeroName,
      child: Material(
        type: MaterialType.transparency,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [logo, welcome],
        ),
      ),
    );
  }

  Widget get logo => Container(
        margin: const EdgeInsets.only(left: 16),
        child: Image.asset('assets/images/logo_transparent.png',
            width: 48, height: 48),
      );

  Widget get welcome => Container(
        margin: const EdgeInsets.only(top: 16, left: 16),
        child: Obx(() => Text('欢迎使用龙岩考试', style: a.textTheme().headline3)),
      );
}
