//  Copyright (c) 2022 qianjunakasumi <i@qianjunakasumi.ren>
//                     qianjunakasumi <qianjunakasumi@outlook.com>
//                     [qianjunakasumi] 千橘雫霞(https://github.com/qianjunakasumi)
//
//       This Source Code Form is subject to the terms of the Mozilla Public
//       License, v. 2.0. If a copy of the MPL was not distributed with this
//       file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:get/get.dart';

import '/src/atoms/utils/list2list.dart';
import '/src/data/apis/accounts/roles/get/get.dart';
import '/src/data/apis/accounts/roles/get/std.dart';
import '/src/data/hives/roles/roles.dart';
import '/src/data/hives/roles/std.dart';
import '/src/data/hives/settings/settings.dart';
import '/src/services/session.dart';

class RoleListController extends GetxController {
  final SessionService s = Get.find();

  var role = <HiveRole>[].obs;

  Future<void> fetch() async {
    final a = APIACCNTsRolesGet(const APIACCNTsRolesGetReq());
    await a.wait();

    role.value = list2List<APIACCNTsRolesGetRRData, HiveRole>(
      a.rsp.roles,
      (e) => HiveRole(
        id: e.id,
        name: e.name,
        school: e.school,
        grade: e.grade,
        classNum: e.c,
        phone: s.phone,
      ),
    );
  }

  Future<void> go(HiveRole r) async {
    await hiveRolesAddA(r.id, r);
    hiveSettingsSetDefaultRole(r.id);
    await s.assigningRole(r);
    Get.offAllNamed('/home');
  }
}
