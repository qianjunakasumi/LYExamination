import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lyexamination/apis/accounts/login/login.dart';
import 'package:lyexamination/apis/accounts/login/std.dart';
import 'package:lyexamination/apis/accounts/roles/switch/std.dart';
import 'package:lyexamination/apis/accounts/roles/switch/switch.dart';
import 'package:lyexamination/apis/achievements/get/get.dart';
import 'package:lyexamination/apis/achievements/get/std.dart';
import 'package:lyexamination/pages/_components/title.dart';
import 'package:lyexamination/pages/progress/error.dart';
import 'package:lyexamination/service/hive.dart';

class ProgressLoginPage extends StatelessWidget {
  final HiveService h = Get.find(tag: 'hive');

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
    final p = h.getCurrentProfile();
    final acc = p.account;

    final sa = APIAccountsLogin(APIAccountsLoginReq(acc.phone, acc.password));
    final saa = APIACCNTsRolesSwitch(APIACCNTsRolesSwitchReq(p.number, p.name));
    try {
      await sa.wait();
      h.setLoginInfo(acc);
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
