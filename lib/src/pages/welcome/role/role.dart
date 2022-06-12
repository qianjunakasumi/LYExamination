//  Copyright (c) 2022 qianjunakasumi <i@qianjunakasumi.ren>
//                     qianjunakasumi <qianjunakasumi@outlook.com>
//                     [qianjunakasumi] 千橘雫霞(https://github.com/qianjunakasumi)
//
//       This Source Code Form is subject to the terms of the Mozilla Public
//       License, v. 2.0. If a copy of the MPL was not distributed with this
//       file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/src/boot/theme.dart';
import '/src/data/hives/roles/std.dart';
import '/src/pages/welcome/components/welcome.dart';
import '/src/pages/welcome/role/card.dart';
import '/src/pages/welcome/role/controller.dart';

class WelcomeRolePage extends StatelessWidget {
  WelcomeRolePage({Key? key}) : super(key: key);

  final RoleListController r = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SafeArea(child: SizedBox(height: 32)),
          const WelcomeComponent(),
          tip,
          Expanded(child: list),
        ],
      ),
    );
  }

  Widget get tip => Container(
        margin: const EdgeInsets.only(top: 16, left: 16, bottom: 16),
        child: Text('请选择您欲登录的学生角色', style: appTextTheme.headline6),
      );

  Widget get list => Obx(() => ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          for (HiveRole d in r.role()) CardComponent(d),
        ],
      ));
}
