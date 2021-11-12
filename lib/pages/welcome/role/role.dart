import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/data/hives/roles/std.dart';
import '/pages/welcome/components/welcome.dart';
import '/pages/welcome/role/card.dart';
import '/pages/welcome/role/controller.dart';
import '/services/app_globe.dart';

class WelcomeRolePage extends StatelessWidget {
  WelcomeRolePage({Key? key}) : super(key: key);

  final AppGlobeService a = Get.find();
  final RoleListController r = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SafeArea(child: SizedBox(height: 32)),
          WelcomeComponent(),
          tip,
          Expanded(child: list),
        ],
      ),
    );
  }

  Widget get tip => Container(
        margin: const EdgeInsets.only(top: 16, left: 16, bottom: 16),
        child: Obx(() => Text('请选择您欲登录的学生角色', style: a.textTheme().headline6)),
      );

  Widget get list => Obx(() => ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          for (HiveRole d in r.role()) CardComponent(d),
        ],
      ));
}
