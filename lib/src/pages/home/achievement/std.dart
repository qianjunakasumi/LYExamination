//  Copyright (c) 2022 qianjunakasumi <i@qianjunakasumi.ren>
//                     qianjunakasumi <qianjunakasumi@outlook.com>
//                     [qianjunakasumi] 千橘雫霞(https://github.com/qianjunakasumi)
//
//       This Source Code Form is subject to the terms of the Mozilla Public
//       License, v. 2.0. If a copy of the MPL was not distributed with this
//       file, You can obtain one at http://mozilla.org/MPL/2.0/.

import '/src/data/apis/achievements/points/std.dart';
import '/src/data/apis/achievements/rankings/std.dart';

class ACHVPSubjectCardData {
  String name;
  String points;
  String rankingZone;
  String ranking;
  String averageZone;
  String averagePoints;
  String mostZone;
  String mostPoints;
  String classRanking;

  ACHVPSubjectCardData(
      {this.name = ' --- ',
      this.points = ' --- ',
      this.rankingZone = ' --- ',
      this.ranking = ' --- ',
      this.averageZone = '--',
      this.averagePoints = ' --- ',
      this.mostZone = '--',
      this.mostPoints = ' --- ',
      this.classRanking = ' --- '});

  void updatePoints(APIACHVsPointsRSData d) {
    this
      ..points = d.points
      ..averageZone = '年段'
      ..averagePoints = d.average
      ..mostZone = '年段'
      ..mostPoints = d.highest;
  }

  void updateRankings(APIACHVsRankingsRSRData d) {
    this
      ..name = d.name
      ..rankingZone = '年段'
      ..ranking = d.gradePlace
      ..classRanking = d.classPlace;
  }

  ACHVPSubjectCardData.futurePoints(APIACHVsPointsRSData d)
      : this(
            name: d.name,
            points: d.points,
            averageZone: '年段',
            averagePoints: d.points,
            mostZone: '年段',
            mostPoints: d.highest);

  ACHVPSubjectCardData.futureRankings(APIACHVsRankingsRSRData d)
      : this(
            name: d.name,
            rankingZone: '年段',
            ranking: d.gradePlace,
            classRanking: d.classPlace);
}
