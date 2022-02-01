//  Copyright (c) 2022 qianjunakasumi <i@qianjunakasumi.ren>
//                     qianjunakasumi <qianjunakasumi@outlook.com>
//                     [qianjunakasumi] 千橘雫霞(https://github.com/qianjunakasumi)
//
//       This Source Code Form is subject to the terms of the Mozilla Public
//       License, v. 2.0. If a copy of the MPL was not distributed with this
//       file, You can obtain one at http://mozilla.org/MPL/2.0/.

import '/data/apis/achievements/get/std.dart';
import '/data/apis/apis.dart';

class APIAchievementsGet extends APIs with HTTPGet {
  final APIAchievementsGetReq req;
  late final APIAchievementsGetRsp rsp;

  static const url = '/Home/Achievement/ajax_showmark_upCallback';

  APIAchievementsGet(this.req)
      : super(url, {'num': req.offset, 'size': req.limit});

  @override
  void parse() {
    rsp = APIAchievementsGetRsp.fromJSON(httpRSP.data);
  }
}
