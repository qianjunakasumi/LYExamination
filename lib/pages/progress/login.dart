import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lyexamination/model/profile.dart';
import 'package:lyexamination/pages/_components/title.dart';
import 'package:lyexamination/pages/progress/error.dart';
import 'package:lyexamination/service/api.dart';
import 'package:lyexamination/service/hive.dart';

class ProgressLoginPage extends StatelessWidget {
  final HiveService h = Get.find(tag: 'hive');
  final APIService a = Get.find(tag: 'api');

  void login() async {
    final p = h.getCurrentProfile();
    final acc = AccountModel(p.phone, p.password);
    try {
      await a.loginAccount(acc);
      h.setLoginInfo(acc);
      Get.offAllNamed('/exam/list');
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
