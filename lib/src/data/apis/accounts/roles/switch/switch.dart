//  Copyright (c) 2022 qianjunakasumi <i@qianjunakasumi.ren>
//                     qianjunakasumi <qianjunakasumi@outlook.com>
//                     [qianjunakasumi] 千橘雫霞(https://github.com/qianjunakasumi)
//
//       This Source Code Form is subject to the terms of the Mozilla Public
//       License, v. 2.0. If a copy of the MPL was not distributed with this
//       file, You can obtain one at http://mozilla.org/MPL/2.0/.

import '/src/data/apis/accounts/roles/switch/std.dart';
import '/src/data/apis/apis.dart';

class APIACCNTsRolesSwitch extends APIs with HTTPPost {
  final APIACCNTsRolesSwitchReq req;

  static const url = '/Home/User/switchStudent';

  APIACCNTsRolesSwitch(this.req)
      : super(url, {'num': req.id, 'name': req.name});
}
