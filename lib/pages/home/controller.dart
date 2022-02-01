//  Copyright (c) 2022 qianjunakasumi <i@qianjunakasumi.ren>
//                     qianjunakasumi <qianjunakasumi@outlook.com>
//                     [qianjunakasumi] 千橘雫霞(https://github.com/qianjunakasumi)
//
//       This Source Code Form is subject to the terms of the Mozilla Public
//       License, v. 2.0. If a copy of the MPL was not distributed with this
//       file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:developer';

import 'package:get/get.dart';

import '/data/apis/achievements/get/get.dart';
import '/data/apis/achievements/get/std.dart';
import '/data/apis/achievements/points/points.dart';
import '/data/apis/achievements/points/std.dart';
import '/data/apis/achievements/rankings/rankings.dart';
import '/data/apis/achievements/rankings/std.dart';
import '/data/apis/exception/api.dart';
import '/services/session.dart';
import 'achievement/std.dart';

class HomeController extends GetxController {
  final SessionService s = Get.find();

  Rx<String> id = ''.obs;
  Rx<String> name = '龙岩考试正在为您查询中，请喝口茶~'.obs;
  Rx<DateTime> date = DateTime(0, 0, 0).obs;
  Rx<String> points = '000'.obs;
  Rx<String> rankings = '0'.obs;
  Rx<String> averagePoints = '000'.obs;
  Rx<String> mostPoints = '000'.obs;
  RxMap<String, Rx<ACHVPSubjectCardData>> subjectsPoints =
      <String, Rx<ACHVPSubjectCardData>>{}.obs;

  void run() async {
    log('开始登录', name: 'LYEx-DBG');
    try {
      await s.loginWithDefaultRole();
    } catch (e, s) {
      log(e.toString(), name: 'LYEx-ERR', stackTrace: s);
      rethrow;
    }

    log('登录成功', name: 'LYEx-DBG');

    final a = APIAchievementsGet(const APIAchievementsGetReq(limit: 1));
    try {
      await a.wait();
    } catch (e, s) {
      log(e.toString(), name: 'LYEx-ERR', stackTrace: s);
      rethrow;
    }

    if (a.rsp.examination.isEmpty) {
      log('无考试成绩', name: 'LYEx-ERR');
      return;
    }

    final e = a.rsp.examination.first;
    id(e.id);
    name(e.name);
    date(DateTime.parse(e.date));

    await Future.wait([updatePoints(), updateRankings()]);

    log('考试数据加载成功', name: 'LYEx-DBG');
  }

  Future<void> updatePoints() async {
    final a = APIACHVsPoints(APIACHVsPointsReq(id()));
    try {
      await a.wait();
    } on APIException {
      rethrow;
    }

    final rsp = a.rsp;
    points(rsp.points);
    averagePoints(rsp.average);
    mostPoints(rsp.highest);
    for (var e in rsp.subjects) {
      if (subjectsPoints[e.name] == null) {
        subjectsPoints[e.name] = ACHVPSubjectCardData.futurePoints(e).obs;
      } else {
        subjectsPoints[e.name]!.update((d) => d!.updatePoints(e));
      }
    }
  }

  Future<void> updateRankings() async {
    final a = APIACHVsRankings(APIACHVsRankingsReq(id()));
    try {
      await a.wait();
    } on APIException {
      rethrow;
    }

    rankings(a.rsp.gradeRanking);

    for (var e in a.rsp.subjectRankings) {
      if (subjectsPoints[e.name] == null) {
        subjectsPoints[e.name] = ACHVPSubjectCardData.futureRankings(e).obs;
      } else {
        subjectsPoints[e.name]!.update((d) => d!.updateRankings(e));
      }
    }
  }
}
