import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lyexamination/apis/accounts/login/login.dart';
import 'package:lyexamination/apis/accounts/login/std.dart';
import 'package:lyexamination/apis/accounts/roles/switch/std.dart';
import 'package:lyexamination/apis/accounts/roles/switch/switch.dart';
import 'package:lyexamination/apis/achievements/get/get.dart';
import 'package:lyexamination/apis/achievements/get/std.dart';
import 'package:lyexamination/hives/accounts/accounts.dart';
import 'package:lyexamination/hives/settings/settings.dart';
import 'package:lyexamination/pages/_components/title.dart';
import 'package:lyexamination/pages/progress/error.dart';

class ProgressLoginPage extends StatelessWidget {
  ProgressLoginPage() {
    run();
  }

  void run() async {
    await login();

    final sa = APIAchievementsGet(APIAchievementsGetReq());
    try {
      await sa.wait();
    } catch (e, s) {
      Get.offAll(ProgressErrorPage(e.toString(), s));
      return;
    }
    // 从数据中匹配
    //final laterExamID = h.getExamInfo(latestExamID);
    //if (laterExamID == null) {
    // 尝试拉取该考试

    Get.offAllNamed('/achievement', arguments: sa.rsp.examination[0]);
    //}
    // 拉取最后一场考试信息
    // 保存最后一场考试信息 key
    // 检查是否存在该考试信息，若无则拉取，拉取完成后返回
  }

  Future<void> login() async {
    final role = hiveSettingsGetDefaultRole();
    final phone = role.phone;
    final password = hiveAccountsGetPassword(phone);

    final sa = APIAccountsLogin(APIAccountsLoginReq(phone, password));
    final saa =
        APIACCNTsRolesSwitch(APIACCNTsRolesSwitchReq(role.id, role.name));
    try {
      await sa.wait();
      hiveSettingsSetCurrentAccount(phone);
      hiveSettingsSetCurrentRole(role.id);
      await saa.wait();
    } catch (e, s) {
      Get.offAll(ProgressErrorPage(e.toString(), s));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        TitleComponent('正在登录...'),
      ],
    );
  }
}
