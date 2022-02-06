//  Copyright (c) 2022 qianjunakasumi <i@qianjunakasumi.ren>
//                     qianjunakasumi <qianjunakasumi@outlook.com>
//                     [qianjunakasumi] 千橘雫霞(https://github.com/qianjunakasumi)
//
//       This Source Code Form is subject to the terms of the Mozilla Public
//       License, v. 2.0. If a copy of the MPL was not distributed with this
//       file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:async';

import 'package:get/get.dart';

import '/src/data/apis/accounts/login/login.dart';
import '/src/data/apis/accounts/login/std.dart';
import '/src/data/apis/accounts/roles/switch/std.dart';
import '/src/data/apis/accounts/roles/switch/switch.dart';
import '/src/data/hives/accounts/accounts.dart';
import '/src/data/hives/roles/std.dart';
import '/src/data/hives/settings/settings.dart';

class SessionService extends GetxService {
  Rx<SessionStatus> status = SessionStatus.offline.obs;
  late HiveRole role;
  late String phone;

  void _markLoggedInWithRole(HiveRole r) {
    status.value = SessionStatus.online;
    role = r;
    phone = r.phone;
  }

  void _markLoggedInWithAccount(String p) {
    status.value = SessionStatus.browse;
    phone = p;
  }

  Future<void> _login(APIAccountsLoginReq r) async {
    final a = APIAccountsLogin(r);
    await a.wait();
  }

  Future<void> _switch(APIACCNTsRolesSwitchReq r) async {
    final a = APIACCNTsRolesSwitch(r);
    await a.wait();
  }

  /// 调用前必须确保默认的学生角色已指定。
  /// 已登录学生角色时立刻返回
  Future<void> loginWithDefaultRole() async {
    if (status() == SessionStatus.online) return;
    final r = hiveSettingsGetDefaultRole();
    await loginWithAssignedRole(r, hiveAccountsGetPassword(r.phone));
  }

  Future<void> loginWithAssignedRole(HiveRole r, String password) async {
    await _login(APIAccountsLoginReq(r.phone, password));
    await _switch(APIACCNTsRolesSwitchReq(r.id, r.name));
    _markLoggedInWithRole(r);
    sessionKeeper = Timer(_sessionExpireRange, keepLoggedIn);
  }

  Future<void> loginWithAssignedAccount(APIAccountsLoginReq r) async {
    await _login(r);
    _markLoggedInWithAccount(r.phone);
  }

  Future<void> assigningRole(HiveRole r) async {
    await _switch(APIACCNTsRolesSwitchReq(r.id, r.name));
    _markLoggedInWithRole(r);
  }

  static const Duration _sessionExpireRange = Duration(minutes: 45);
  late Timer sessionKeeper;

  void keepLoggedIn() {
    HiveSettingsSession.expire = DateTime.now().add(_sessionExpireRange);
    status.value = SessionStatus.offline;
    loginWithAssignedRole(role, hiveAccountsGetPassword(role.phone));
  }
}

enum SessionStatus {
  offline,

  /// 仅登录帐号，未指定学生角色。禁止获取学生角色下的数据
  browse,
  online,
  failure,
}
