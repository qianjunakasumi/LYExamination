//  Copyright (c) 2022 qianjunakasumi <i@qianjunakasumi.ren>
//                     qianjunakasumi <qianjunakasumi@outlook.com>
//                     [qianjunakasumi] 千橘雫霞(https://github.com/qianjunakasumi)
//
//       This Source Code Form is subject to the terms of the Mozilla Public
//       License, v. 2.0. If a copy of the MPL was not distributed with this
//       file, You can obtain one at http://mozilla.org/MPL/2.0/.

import '/data/apis/util.dart';

class APIACHVsPointsReq {
  final String id;
  final String zone;

  const APIACHVsPointsReq(this.id, {this.zone = 'q'});
}

class APIACHVsPointsRsp {
  final String points;
  final String average;
  final String highest;
  final List<APIACHVsPointsRSData> subjects;
  final int participants;

  const APIACHVsPointsRsp(this.points, this.average, this.highest,
      this.subjects, this.participants);

  APIACHVsPointsRsp.fromJSON(Map<String, dynamic> d, String z)
      : this(
          d['my_allscore'].toString(),
          d['zongfenpingjunfen'].toString(),
          d['zuigaofen'].toString(),
          dynamicToTypeList<APIACHVsPointsRSData>(
              d['geke'], (dd) => APIACHVsPointsRSData.fromJSON(dd, z)),
          d['kaoshirenshu'],
        );
}

class APIACHVsPointsRSData {
  final String name;
  final String points;
  final String average;
  final String highest;

  const APIACHVsPointsRSData(
      this.name, this.points, this.average, this.highest);

  APIACHVsPointsRSData.fromJSON(Map<String, dynamic> d, String z)
      : this(d['subject'], d['score'], d['${z}_average'], d['${z}_max']);
}
