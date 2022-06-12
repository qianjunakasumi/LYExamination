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
import '/src/pages/home/achievement/card.dart';
import '/src/pages/home/controller.dart';

class HomeAchievementPage extends StatelessWidget {
  HomeAchievementPage({Key? key}) : super(key: key);

  final HomeController h = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            name,
            quick,
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              info,
              const SizedBox(height: 24),
              Text('学科', style: appTextTheme.headline5),
              const SizedBox(height: 16),
              Obx(() => Column(
                    children: [
                      for (var d in h.subjectsPoints().values)
                        ACHVPSubjectCardComponent(d),
                    ],
                  )),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Center(
          child: Text('·    你已看完所有的啦    ·',
              style:
                  appTextTheme.headline6!.copyWith(color: Colors.grey[400])),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget get name => Container(
        margin: const EdgeInsets.all(16),
        child: Obx(() => Text(h.name(), style: appTextTheme.headline5)),
      );

  Widget get quick => Container(
        margin: const EdgeInsets.only(left: 16, top: 8, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Text('总\n分'),
                const SizedBox(width: 16),
                Obx(() => Text(h.points(), style: appTextTheme.headline4)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('年段\n名次'),
                const SizedBox(width: 16),
                Obx(() => Text(h.rankings(), style: appTextTheme.headline4)),
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
                //color: Get.theme.primaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
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
                //color: Get.theme.primaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
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
