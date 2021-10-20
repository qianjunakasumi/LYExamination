import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lyexamination/controllers/welcome/role.dart';
import 'package:lyexamination/pages/welcome/common/welcome.dart';
import 'package:lyexamination/pages/welcome/role/card.dart';
import 'package:lyexamination/pages/welcome/role/std.dart';
import 'package:lyexamination/service.dart';

class WelcomeRolePage extends StatelessWidget {
  WelcomeRolePage({Key? key}) : super(key: key);

  final AppGlobeService a = Get.find(tag: 'app');
  final RoleListController r = Get.find(tag: roleListControllerName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 64),
          SafeArea(child: WelcomeComponent()),
          tip,
          Expanded(child: list),
        ],
      ),
    );
  }

  Widget get tip => Container(
        margin: const EdgeInsets.only(top: 16, left: 16, bottom: 16),
        child: Obx(() =>
            Text('请选择您欲登录学生角色', style: a.theme.value.textTheme.headline6)),
      );

  Widget get list => Obx(() => ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          for (CardComponentModel d in r.role()) CardComponent(d),
        ],
      ));
}
