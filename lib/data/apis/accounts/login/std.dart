//  Copyright (c) 2022 qianjunakasumi <i@qianjunakasumi.ren>
//                     qianjunakasumi <qianjunakasumi@outlook.com>
//                     [qianjunakasumi] 千橘雫霞(https://github.com/qianjunakasumi)
//
//       This Source Code Form is subject to the terms of the Mozilla Public
//       License, v. 2.0. If a copy of the MPL was not distributed with this
//       file, You can obtain one at http://mozilla.org/MPL/2.0/.

class APIAccountsLoginReq {
  final String phone;
  final String password;

  const APIAccountsLoginReq(this.phone, this.password);
}

class APIAccountsLoginRsp {
  final int status;
  final String message;

  const APIAccountsLoginRsp(this.status, this.message);

  APIAccountsLoginRsp.fromJSON(Map<String, dynamic> d)
      : this(d['code'], d['msg']);
}
