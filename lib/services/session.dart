import 'package:get/get.dart';

import '/data/apis/accounts/login/login.dart';
import '/data/apis/accounts/login/std.dart';
import '/data/apis/accounts/roles/switch/std.dart';
import '/data/apis/accounts/roles/switch/switch.dart';
import '/data/hives/accounts/accounts.dart';
import '/data/hives/roles/std.dart';
import '/data/hives/settings/settings.dart';

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

  /// 使用默认的学生角色登录。
  /// 调用前必须确保默认的学生角色已指定。
  /// 已登录学生角色时立刻返回
  Future<void> loginWithDefaultRole() async {
    if (status() == SessionStatus.online) return;
    final r = hiveSettingsGetDefaultRole();
    loginWithAssignedRole(r, hiveAccountsGetPassword(r.phone));
  }

  Future<void> loginWithAssignedRole(HiveRole r, String password) async {
    _login(APIAccountsLoginReq(r.phone, password));
    _switch(APIACCNTsRolesSwitchReq(r.id, r.name));
    _markLoggedInWithRole(r);
  }

  Future<void> loginWithAssignedAccount(APIAccountsLoginReq r) async {
    await _login(r);
    _markLoggedInWithAccount(r.phone);
  }

  Future<void> assigningRole(HiveRole r) async {
    await _switch(APIACCNTsRolesSwitchReq(r.id, r.name));
    _markLoggedInWithRole(r);
  }

  /// TODO 状态持续控制器
}

/// 会话状态
enum SessionStatus {
  offline,

  /// 仅登录帐号，未指定学生角色。禁止获取学生角色下的数据
  browse,
  online,
  failure,
}
