import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lyexamination/service.dart';

const welcomeComponentHeroName = 'WelcomeComponent';

class WelcomeComponent extends StatelessWidget {
  WelcomeComponent({Key? key}) : super(key: key);

  final AppGlobeService a = Get.find(tag: 'app');

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
        child: Obx(
            () => Text('欢迎使用龙岩考试', style: a.theme.value.textTheme.headline3)),
      );
}
