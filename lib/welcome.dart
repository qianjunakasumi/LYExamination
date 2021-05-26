import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomePage extends StatelessWidget {
  static final ButtonStyle _style = ButtonStyle(
    elevation: MaterialStateProperty.all(0),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
    ),
    padding: MaterialStateProperty.all(
      EdgeInsets.only(top: 12, left: 32, right: 32, bottom: 12),
    ),
  );

  final Widget _passwordLogin = ElevatedButton(
    onPressed: () => print('密码'),
    style: _style,
    child: ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.lock_outline_rounded),
              Text(
                '密码登录',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Icon(Icons.keyboard_arrow_right_outlined),
        ],
      ),
    ),
  );

  final Widget _wechatLogin = OutlinedButton(
    onPressed: () => print('微信'),
    style: _style,
    child: ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/icons/wechat.png', width: 20),
              Text('微信登录'),
            ],
          ),
          Icon(Icons.keyboard_arrow_right_outlined),
        ],
      ),
    ),
  );

  static const _license =
      'https://github.com/qianjunakasumi/LYExamination/blob/main/LICENSE';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 8),
                child: Image.asset('assets/lighthouse.png', width: 200),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 32),
                child: Text(
                  '龙岩考试',
                  textScaleFactor: 2,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4,
                  ),
                ),
              ),
              _passwordLogin,
              Container(
                margin: EdgeInsets.only(top: 8, bottom: 32),
                child: _wechatLogin,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black45, fontSize: 12),
                  children: [
                    TextSpan(text: '登录即代表您已理解'),
                    TextSpan(
                      text: '《开源软件许可证》',
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launch(_license);
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
