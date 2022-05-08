//  Copyright (c) 2022 qianjunakasumi <i@qianjunakasumi.ren>
//                     qianjunakasumi <qianjunakasumi@outlook.com>
//                     [qianjunakasumi] 千橘雫霞(https://github.com/qianjunakasumi)
//
//       This Source Code Form is subject to the terms of the Mozilla Public
//       License, v. 2.0. If a copy of the MPL was not distributed with this
//       file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/src/atoms/controller/snackbar.dart';
import '/src/pages/home/achievement/std.dart';
import '/src/services/app_globe.dart';

class ACHVPSubjectCardComponent extends StatelessWidget {
  final Rx<ACHVPSubjectCardData> d;

  final s = Get.put(SnackbarCTR());

  ACHVPSubjectCardComponent(this.d, {Key? key}) : super(key: key);

  static Color fixed = Colors.white.withOpacity(0.85);

  final AppGlobeService a = Get.find();

  @override
  Widget build(BuildContext context) {
    TextStyle headline2 = a.textTheme().headline2!.copyWith(color: fixed);
    TextStyle headline3 = a.textTheme().headline3!.copyWith(color: fixed);
    TextStyle headline6 = a.textTheme().headline6!.copyWith(
          color: fixed,
          fontWeight: FontWeight.bold,
        );

    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Get.theme.primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(d.value.name, style: headline3),
              ElevatedButton(
                onPressed: () => s.create('还未完成哦'),
                style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(
                      const TextStyle(fontWeight: FontWeight.bold)),
                  foregroundColor:
                      MaterialStateProperty.all(const Color(0xFF36CFC9)),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  elevation: MaterialStateProperty.all(0),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.only(
                        top: 8, left: 16, right: 16, bottom: 8),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                ),
                child: const Text(
                  '查看详情',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Obx(() => Text(d.value.points, style: headline2)),
                  const Text(
                    '分',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                    textScaleFactor: 0.88,
                  ),
                ],
              ),
              Row(
                children: [
                  Obx(() => Text(
                        d.value.rankingZone,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                        textScaleFactor: 0.88,
                      )),
                  Obx(() => Text(d.value.ranking, style: headline2)),
                  const Text(
                    '名',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                    textScaleFactor: 0.88,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Obx(() => Text(
                        d.value.averageZone + '\n平均',
                        style: headline6,
                        textScaleFactor: 0.88,
                      )),
                  const SizedBox(width: 12),
                  Obx(() => Text(d.value.averagePoints, style: headline6)),
                ],
              ),
              Row(
                children: [
                  Obx(() => Text(
                        d.value.mostZone + '\n最高',
                        style: headline6,
                        textScaleFactor: 0.88,
                      )),
                  const SizedBox(width: 12),
                  Obx(() => Text(d.value.mostPoints, style: headline6)),
                ],
              ),
              Row(
                children: [
                  Text(
                    '班级\n名次',
                    style: headline6,
                    textScaleFactor: 0.88,
                  ),
                  const SizedBox(width: 12),
                  Obx(() => Text(d.value.classRanking, style: headline6)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
