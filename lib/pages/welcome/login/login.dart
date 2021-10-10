import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lyexamination/controllers/login.dart';
import 'package:lyexamination/messenger.dart';
import 'package:lyexamination/pages/welcome/login/form.dart';

class WelcomeLoginPage extends StatelessWidget {
  WelcomeLoginPage({Key? key}) : super(key: key);

  final LoginFormController c =
      Get.put(LoginFormController(), tag: 'WelcomeLoginForm');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 64),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: main,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> get main => [
        logo,
        welcome,
        tip,
        form,
        buttons,
      ];

  Widget get logo => Container(
        margin: const EdgeInsets.only(left: 16),
        child: Image.asset('assets/images/logo_transparent.png',
            width: 48, height: 48),
      );

  Widget get welcome => Container(
        margin: const EdgeInsets.only(top: 8, left: 16),
        child: Text('欢迎使用龙岩考试', style: Get.textTheme.headline3),
      );

  Widget get tip => Container(
        margin: const EdgeInsets.only(top: 16, left: 16),
        child: Text('请使用您的\u9F99\u5CA9\u5BB6\u6821帐号登录',
            style: Get.textTheme.headline6),
      );

  Widget get form => Container(
        margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: FormComponent(),
      );

  Widget get buttons => Container(
        margin: const EdgeInsets.only(top: 32, left: 16, right: 16),
        child: Row(
          children: [
            Expanded(flex: 1, child: aboutButton),
            const SizedBox(width: 8),
            Expanded(flex: 2, child: nextButton),
          ],
        ),
      );

  EdgeInsets get buttonEdge => const EdgeInsets.only(top: 14, bottom: 14);

  RoundedRectangleBorder get buttonShape =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(8));

  Widget get aboutButton => OutlinedButton(
        onPressed: () => Messenger.snackBar('这个功能尚未准备好哦'),
        style:
            OutlinedButton.styleFrom(padding: buttonEdge, shape: buttonShape),
        child: const Text('了解详情'),
      );

  Widget get nextButton => ElevatedButton(
        onPressed: () => c.go(),
        style: ElevatedButton.styleFrom(
            elevation: 0, padding: buttonEdge, shape: buttonShape),
        child: const Text('下一步'),
      );
}
