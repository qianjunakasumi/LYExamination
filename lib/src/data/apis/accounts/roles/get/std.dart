//  Copyright (c) 2022 qianjunakasumi <i@qianjunakasumi.ren>
//                     qianjunakasumi <qianjunakasumi@outlook.com>
//                     [qianjunakasumi] 千橘雫霞(https://github.com/qianjunakasumi)
//
//       This Source Code Form is subject to the terms of the Mozilla Public
//       License, v. 2.0. If a copy of the MPL was not distributed with this
//       file, You can obtain one at http://mozilla.org/MPL/2.0/.

import '/src/data/apis/util.dart';

class APIACCNTsRolesGetReq {
  final int length;

  const APIACCNTsRolesGetReq({this.length = 9223372036854775807});
}

class APIACCNTsRolesGetRsp {
  final String count;
  final List<APIACCNTsRolesGetRRData> roles;

  const APIACCNTsRolesGetRsp(this.count, this.roles);

  APIACCNTsRolesGetRsp.fromJSON(Map<String, dynamic> d)
      : this(
          d['count'],
          dynamicToTypeList<APIACCNTsRolesGetRRData>(
              d['rows'], (dd) => APIACCNTsRolesGetRRData.fromJSON(dd)),
        );
}

class APIACCNTsRolesGetRRData {
  final String id;
  final String name;
  final String school;
  final String grade;
  final String c; // class
  final int nowCheck; // 不详

  const APIACCNTsRolesGetRRData(
      this.id, this.name, this.school, this.grade, this.c, this.nowCheck);

  APIACCNTsRolesGetRRData.fromJSON(Map<String, dynamic> d)
      : this(
          d['unum'],
          d['stuname'],
          d['school'],
          d['grade'],
          d['class'],
          d['nowcheck'],
        );
}
