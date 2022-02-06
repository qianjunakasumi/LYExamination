//  Copyright (c) 2022 qianjunakasumi <i@qianjunakasumi.ren>
//                     qianjunakasumi <qianjunakasumi@outlook.com>
//                     [qianjunakasumi] 千橘雫霞(https://github.com/qianjunakasumi)
//
//       This Source Code Form is subject to the terms of the Mozilla Public
//       License, v. 2.0. If a copy of the MPL was not distributed with this
//       file, You can obtain one at http://mozilla.org/MPL/2.0/.

import '/src/data/apis/achievements/points/std.dart';
import '/src/data/apis/apis.dart';

class APIACHVsPoints extends APIs with HTTPPost {
  final APIACHVsPointsReq req;
  late final APIACHVsPointsRsp rsp;

  static const url = '/Home/Newscore/ajaxxqscore';

  APIACHVsPoints(this.req)
      : super(url, {'item_id': req.id, 'leixing': req.zone});

  @override
  void parse() {
    rsp = APIACHVsPointsRsp.fromJSON(httpRSP.data, req.zone);
  }
}
