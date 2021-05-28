import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lyexamination/common/app/config.dart';
import 'package:lyexamination/widget/qa.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsPage extends StatelessWidget {
  final String method;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: EdgeInsets.only(left: 32, right: 32, bottom: 80),
              children: [
                Container(
                  margin: EdgeInsets.only(top: 40, bottom: 32),
                  child:
                      Image.asset('assets/background/terms.png', height: 200),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 32),
                  child: Center(
                    child: Text(
                      '条款',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textScaleFactor: 2,
                    ),
                  ),
                ),
                Text('理解您要跳过这些内容，但为了维护您的权益，仍请花些时间了解'),
                Container(
                  margin: EdgeInsets.only(top: 32, bottom: 16),
                  child: ElevatedButton(
                    onPressed: () => launch(config.githubAddr),
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.only(top: 12, bottom: 12),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('服务提供方：', textScaleFactor: 1.2),
                        Text('${config.sponsor} <${config.email}>'),
                      ],
                    ),
                  ),
                ),
                Text('服务器地址：' + config.apiAddr),
                Divider(color: Colors.grey),
                QAWidget(
                  '为什么需要了解服务信息？',
                  '为促进自由软件发展，我们已将其开源。这意味着任何人都可取得该软件原始代码的副本。为保护您的个人信息安全，需要对服务器身份验证，以确保信息不被存储、披露、贩卖。',
                ),
                QAWidget(
                  '如何验证该软件受官方背书/信任？',
                  '除非您自行构建，否则有且仅有以下服务器被信任：api-lyexamination.qianjunakasumi.ren',
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 16),
                child: ElevatedButton(
                  onPressed: () =>
                      Fluttertoast.showToast(msg: 'Remote Server Failed'),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.only(top: 12, left: 64, right: 64, bottom: 12),
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

  TermsPage(this.method);
}
