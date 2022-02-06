//  Copyright (c) 2022 qianjunakasumi <i@qianjunakasumi.ren>
//                     qianjunakasumi <qianjunakasumi@outlook.com>
//                     [qianjunakasumi] 千橘雫霞(https://github.com/qianjunakasumi)
//
//       This Source Code Form is subject to the terms of the Mozilla Public
//       License, v. 2.0. If a copy of the MPL was not distributed with this
//       file, You can obtain one at http://mozilla.org/MPL/2.0/.

import '/src/data/apis/accounts/login/std.dart';
import '/src/data/apis/apis.dart';
import '/src/data/apis/exception/bad_respond.dart';

class APIAccountsLogin extends APIs with HTTPPost {
  final APIAccountsLoginReq req;
  late final APIAccountsLoginRsp rsp;

  static const url = '/Home/User/ajax_parlogin';

  APIAccountsLogin(this.req)
      : super(url, {'Login_phone': req.phone, 'parpwd': req.password});

  @override
  void parse() {
    rsp = APIAccountsLoginRsp.fromJSON(httpRSP.data);
  }

  @override
  void verify() {
    switch (rsp.status) {
      case 100:
        return;

      case 401: // 密码错误
      case 402: // 帐号未注册
        throw APIBadRespondException(httpRSP, '帐号或密码错误');

      default:
        throw APIBadRespondException(httpRSP, '无法理解的服务器响应。',
            panic: true, testament: rsp.message);
    }
  }
}
