import 'package:flutter/material.dart';
import 'package:lyexamination/pages/_components/title.dart';
import 'package:lyexamination/pages/create/account/form.dart';

class CreateAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleComponent('欢迎登录'),
        Text('龙岩考试  申请'),
        SizedBox(height: 8),
        Text(
          '登录到您的 龙岩家校 帐号',
          textScaleFactor: 1.56,
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 32),
        Text('您可随时取消登录', style: TextStyle(color: Colors.grey)),
        SizedBox(height: 8),
        FormComponent(),
      ],
    );
  }
}
