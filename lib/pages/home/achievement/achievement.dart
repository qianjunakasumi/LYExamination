import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/pages/home/achievement/card.dart';
import '/pages/home/controller.dart';
import '/service.dart';

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
          child: old,
        ),
      ],
    );
  }

  Widget get name => Container(
        margin: const EdgeInsets.all(16),
        child: Obx(() => Text(h.name(), style: a.theme().textTheme.headline5)),
      );

  Widget get quick => Container(
        margin: EdgeInsets.only(left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text('总\n分'),
                SizedBox(width: 16),
                Obx(() => Text(
                      h.points(),
                      style: a.theme().textTheme.headline4,
                    )),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text('年段\n名次'),
                SizedBox(width: 16),
                Obx(() => Text(
                      h.rankings(),
                      style: a.theme().textTheme.headline4,
                    )),
              ],
            ),
          ],
        ),
      );

  Widget get old => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
                      Obx(() =>
                          Text('平\n均', style: a.theme().textTheme.headline6)),
                      Obx(() => Text(h.averagePoints(),
                          style: a.theme().textTheme.headline3)),
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
                      Obx(() =>
                          Text('最\n高', style: a.theme().textTheme.headline6)),
                      Obx(() => Text(h.mostPoints(),
                          style: a.theme().textTheme.headline3)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Text('学科', style: Get.theme.textTheme.headline5),
          const SizedBox(height: 24),
          Obx(() => Column(
                children: [
                  for (var d in h.subjectsPoints().values)
                    ACHVPSubjectCardComponent(d),
                ],
              )),
          const SizedBox(height: 24),
        ],
      );
}
