//  Copyright (c) 2022 qianjunakasumi <i@qianjunakasumi.ren>
//                     qianjunakasumi <qianjunakasumi@outlook.com>
//                     [qianjunakasumi] 千橘雫霞(https://github.com/qianjunakasumi)
//
//       This Source Code Form is subject to the terms of the Mozilla Public
//       License, v. 2.0. If a copy of the MPL was not distributed with this
//       file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:html/parser.dart' as html show parse;

import '/src/data/apis/achievements/rankings/std.dart';
import '/src/data/apis/apis.dart';

class APIACHVsRankings extends APIs with HTTPGet {
  final APIACHVsRankingsReq req;
  late final APIACHVsRankingsRsp rsp;

  APIACHVsRankings(this.req)
      : super(
            '\x68\x74\x74\x70\x73\x3A\x2F\x2F\x6D\x69\x63\x2E\x66\x6A\x6A\x78\x68\x6C\x2E\x63\x6F\x6D\x2F\x34\x32\x62\x61\x6F\x62\x61\x6F\x62\x61\x6E\x70\x61\x69\x2F\x69\x6E\x64\x65\x78\x2E\x70\x68\x70/Admin/Zzy/zhenduan/item_id/' +
                req.id,
            {});

  @override
  void parse() {
    rsp = APIACHVsRankingsRsp.fromHTML(html.parse(httpRSP.data));
  }
}
