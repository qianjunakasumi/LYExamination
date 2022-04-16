//  Copyright (c) 2022 qianjunakasumi <i@qianjunakasumi.ren>
//                     qianjunakasumi <qianjunakasumi@outlook.com>
//                     [qianjunakasumi] 千橘雫霞(https://github.com/qianjunakasumi)
//
//       This Source Code Form is subject to the terms of the Mozilla Public
//       License, v. 2.0. If a copy of the MPL was not distributed with this
//       file, You can obtain one at http://mozilla.org/MPL/2.0/.

import '/src/atoms/utils/list2list.dart';

class APIAchievementsGetReq {
  final int offset;
  final int limit;

  const APIAchievementsGetReq(
      {this.offset = 0, this.limit = 9223372036854775807});
}

class APIAchievementsGetRsp {
  final int count;
  final List<APIAchievementsGetREData> examination;

  const APIAchievementsGetRsp(this.count, this.examination);

  APIAchievementsGetRsp.fromJSON(Map<String, dynamic> d)
      : this(
          d['count'],
          dynamicList2List<APIAchievementsGetREData>(
            d['title'],
            (dd) => APIAchievementsGetREData.fromJSON(dd),
          ),
        );
}

class APIAchievementsGetREData {
  final String id;
  final String name;
  final String date;

  const APIAchievementsGetREData(this.id, this.name, this.date);

  APIAchievementsGetREData.fromJSON(Map<String, dynamic> d)
      : this(d['id'], d['name'], d['cdate']);
}
