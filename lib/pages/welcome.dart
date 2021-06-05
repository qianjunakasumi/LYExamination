import 'package:flutter/material.dart';
import 'package:lyexamination/boot/app/config.dart';
import 'package:lyexamination/dao/student.dart';
import 'package:lyexamination/model/database/table/student.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomePage extends StatelessWidget {
  void _skip(BuildContext context, List<Student> stu) {
    if (stu.length != 0) {
      // Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      // TODO 登录
    }
  }

  final ButtonStyle _btnStyle = ButtonStyle(
    elevation: MaterialStateProperty.all(0),
    padding: MaterialStateProperty.all(
      EdgeInsets.only(top: 12, bottom: 12),
    ),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    retrieveStudents().then((stu) => _skip(context, stu));

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: EdgeInsets.only(left: 24, right: 24, bottom: 80),
              children: [
                SizedBox(height: 128),
                Image.asset('assets/background/welcome.png', height: 128),
                SizedBox(height: 128),
                Center(
                  child: Text(
                    '龙岩考试',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textScaleFactor: 2.16,
                  ),
                ),
                SizedBox(height: 4),
                Divider(),
                SizedBox(height: 24),
                Text('理解您要跳过这些内容，但是为了维护您的权益，仍请花些时间了解'),
                SizedBox(height: 24),
                Text('谁提供服务', textScaleFactor: 1.32),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => launch(config.githubAddr),
                  style: _btnStyle,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('服务提供方：', textScaleFactor: 1.2),
                      Text('${config.sponsor} <${config.email}>'),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Text('服务器：' + config.apiAddr),
                Divider(color: Colors.grey),
                Text(
                  '我们倡导自由软件运动，因此每个人都可以为您提供服务。有且仅有 “api-lyexamination.qianjunakasumi.ren”（官方）服务器受保护。不受保护的服务器可能存储、披露或贩卖您的个人信息。',
                ),
                SizedBox(height: 16),
                Text('著作权信息', textScaleFactor: 1.32),
                SizedBox(height: 16),
                Text('Copyright (c) 2021-现在 千橘 雫霞'),
                SizedBox(height: 16),
                Text('许可证', textScaleFactor: 1.32),
                SizedBox(height: 16),
                Text('Mozilla 公共许可证 2.0（Mozilla Public License 2.0）'),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 16),
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/create'),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.only(top: 12, left: 88, right: 88, bottom: 12),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                  ),
                  child: Text(
                    '我已阅读',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
