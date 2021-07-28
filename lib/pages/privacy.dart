import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lyexamination/boot/config.dart';
import 'package:lyexamination/service/profile.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPage extends StatelessWidget {
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

  final ProfileService profile = Get.put(ProfileService());

  @override
  Widget build(BuildContext context) {
    //retrieveStudents().then((stu) => _skip(context, stu));

    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        SizedBox(height: 64),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '龙岩考试',
                  textScaleFactor: 2.16,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '隐私权政策',
                  textScaleFactor: 2.16,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Image.asset('assets/icon/privacy.png', width: 64),
            SizedBox(),
          ],
        ),
        SizedBox(height: 24),
        Divider(),
        SizedBox(height: 24),
        Text(
          '发布日期：2021年7月8日',
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        Text(
          '生效日期：2021年7月8日',
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 24),
        Text(
          '我们深知您托付给我们的隐私事关重大。因此，在下一步之前，请阅读关于我们如何保护您隐私的政策和妥善处理您隐私的承诺。重点内容已为您标注星号，请特别关注。',
        ),
        SizedBox(height: 24),
        Text('保护您的隐私安全无虞 *', textScaleFactor: 1.32),
        SizedBox(height: 16),
        Text(
          '“龙岩考试” 是遵循自由软件许可发行的。因此，每个人都可以发行本软件的衍生版本。恶意的发行方不受 “ 龙岩考试应用事务局 ” 监管，可能造成您的隐私泄露等不必要的麻烦。',
        ),
        SizedBox(height: 8),
        Text('本软件的发行方是：'),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => launch(config.githubAddr),
          style: _btnStyle,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.launch, size: 16),
              SizedBox(width: 8),
              Text('${config.sponsor} <${config.email}>'),
            ],
          ),
        ),
        SizedBox(height: 16),
        Text(
          '请确认您信任该发行方。有且仅有 “lyex@qianjunakasumi.ren” 是官方发行的。',
        ),
        SizedBox(height: 8),
        Text('请确认您下载本软件的渠道合法。官方版仅通过 龙岩考试应用事务局 和 GitHub 仓库 Release 发行。'),
        SizedBox(height: 24),
        Text('了解更多受监管的发行方 / 检举恶意行为？'),
        SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            launch(
              'mqqopensdkapi://bizAgent/qm/qr?url=http%3A%2F%2Fqm.qq.com%2Fcgi-bin%2Fqm%2Fqr%3Ffrom%3Dapp%26p%3Dandroid%26jump_from%3Dwebapi%26k%3DLbJQs4vVwxTSKRCK2TfzOyl8X9Op_jNk',
            );
          },
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.black54),
            backgroundColor: MaterialStateProperty.all(Colors.white),
            elevation: MaterialStateProperty.all(1),
            padding: MaterialStateProperty.all(
              EdgeInsets.only(top: 12, bottom: 12),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.launch, size: 16),
              SizedBox(width: 8),
              Text('加入龙岩考试应用事务局'),
            ],
          ),
        ),
        SizedBox(height: 8),
        SizedBox(height: 24),
        Text('内容更新中...', textScaleFactor: 1.32),
        SizedBox(height: 24),
        Text('许可证', textScaleFactor: 1.32),
        SizedBox(height: 16),
        Text('Mozilla 公共许可证 2.0（Mozilla Public License 2.0）'),
        SizedBox(height: 24),
        Divider(),
        SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () => Get.toNamed('/create/account'),
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
                child: Text(
                  '我已知晓',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: OutlinedButton(
                onPressed: () => exit(0),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    EdgeInsets.only(top: 12, bottom: 12),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                ),
                child: Text(
                  '退出',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 64),
      ],
    );
  }
}
