//  Copyright (c) 2022 qianjunakasumi <i@qianjunakasumi.ren>
//                     qianjunakasumi <qianjunakasumi@outlook.com>
//                     [qianjunakasumi] 千橘雫霞(https://github.com/qianjunakasumi)
//
//       This Source Code Form is subject to the terms of the Mozilla Public
//       License, v. 2.0. If a copy of the MPL was not distributed with this
//       file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:uuid/uuid.dart';

/// 接口鉴权基础类
/// webpack:///./src/api/interfaceAuthentication.js
class Authentication {
  /// userName
  final String bicode;

  final String password;

  /// 与后台时间差
  final int timeDifference;

  const Authentication(this.bicode, this.password, this.timeDifference);

  String guid() => const Uuid().v4();

  int getDateString() => DateTime.now().millisecondsSinceEpoch;

  AuthenticationMakeResult make() {
    String authguid = guid();
    int authtimestamp = getDateString() - timeDifference;
    String authtokenOrigin = authguid + authtimestamp.toString() + password;

    return AuthenticationMakeResult(
      authguid,
      authtimestamp,
      bicode,
      authtokenOrigin,
      md5.convert(utf8.encode(authtokenOrigin)).toString(),
    );
  }
}

/// 接口鉴权基础类计算最终鉴权字符串结果
class AuthenticationMakeResult {
  final String authguid;
  final int authtimestamp;
  final String authbizcode;
  final String authtokenOrigin;
  final String authtoken;

  const AuthenticationMakeResult(this.authguid, this.authtimestamp,
      this.authbizcode, this.authtokenOrigin, this.authtoken);

  @override
  String toString() {
    return '''Instance of 'AuthenticationMakeResult':
{
  'authguid': $authguid,
  'authtimestamp': $authtimestamp,
  'authbizcode': $authbizcode,
  'authtokenOrigin': $authtokenOrigin,
  'authtoken': $authtoken,
}''';
  }
}
