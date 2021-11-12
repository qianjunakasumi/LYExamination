import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/pages/home/achievement/card.dart';
import '/pages/home/controller.dart';
import '/services/app_globe.dart';

class HomeAchievementPage extends StatelessWidget {
  HomeAchievementPage({Key? key}) : super(key: key);

  final AppGlobeService a = Get.find();
  final HomeController h = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              name,
              quick,
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              info,
              const SizedBox(height: 32),
              Obx(() => Text('学科', style: a.textTheme().headline5)),
              const SizedBox(height: 24),
              Obx(() => Column(
                    children: [
                      for (var d in h.subjectsPoints().values)
                        ACHVPSubjectCardComponent(d),
                    ],
                  )),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ],
    );
  }

  Widget get name => Container(
        margin: const EdgeInsets.all(16),
        child: Obx(() => Text(h.name(), style: a.textTheme().headline5)),
      );

  Widget get quick => Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Text('总\n分'),
                const SizedBox(width: 16),
                Obx(() => Text(h.points(), style: a.textTheme().headline4)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('年段\n名次'),
                const SizedBox(width: 16),
                Obx(() => Text(h.rankings(), style: a.textTheme().headline4)),
              ],
            ),
          ],
        ),
      );

  Widget get info => Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Get.theme.primaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(16)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    '平\n均',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Obx(() => Text(
                        h.averagePoints(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Get.theme.primaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(16)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    '最\n高',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Obx(() => Text(
                        h.mostPoints(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
          ),
        ],
      );
}
