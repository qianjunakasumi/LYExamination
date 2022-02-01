//  Copyright (c) 2022 qianjunakasumi <i@qianjunakasumi.ren>
//                     qianjunakasumi <qianjunakasumi@outlook.com>
//                     [qianjunakasumi] 千橘雫霞(https://github.com/qianjunakasumi)
//
//       This Source Code Form is subject to the terms of the Mozilla Public
//       License, v. 2.0. If a copy of the MPL was not distributed with this
//       file, You can obtain one at http://mozilla.org/MPL/2.0/.

import '/data/apis/accounts/roles/get/std.dart';
import '/data/apis/apis.dart';

class APIACCNTsRolesGet extends APIs with HTTPGet {
  final APIACCNTsRolesGetReq req;
  late final APIACCNTsRolesGetRsp rsp;

  static const url = '/Home/User/ajax_SelectStudent_upCallback';

  APIACCNTsRolesGet(this.req) : super(url, {'size': req.length});

  @override
  void parse() {
    rsp = APIACCNTsRolesGetRsp.fromJSON(httpRSP.data);
  }
}
