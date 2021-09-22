import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lyexamination/apis/accounts/login/login.dart';
import 'package:lyexamination/apis/accounts/login/std.dart';
import 'package:lyexamination/apis/accounts/roles/switch/std.dart';
import 'package:lyexamination/apis/accounts/roles/switch/switch.dart';
import 'package:lyexamination/apis/achievements/get/get.dart';
import 'package:lyexamination/apis/achievements/get/std.dart';
import 'package:lyexamination/apis/achievements/points/points.dart';
import 'package:lyexamination/apis/achievements/points/std.dart';
import 'package:lyexamination/apis/exception/api.dart';
import 'package:lyexamination/model/exam_summary.dart';
import 'package:lyexamination/pages/_components/title.dart';
import 'package:lyexamination/pages/progress/error.dart';
import 'package:lyexamination/service/hive.dart';

class ProgressLoginPage extends StatelessWidget {
  final HiveService h = Get.find(tag: 'hive');

  void login() async {
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
    login();
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        TitleComponent('正在登录...'),
      ],
    );
  }
}
