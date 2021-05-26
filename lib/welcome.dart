import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomePage extends StatelessWidget {
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
                margin: EdgeInsets.only(bottom: 16),
                child: Image.asset('assets/lighthouse.png', width: 200),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 48),
                child: Text(
                  '龙岩考试',
                  textScaleFactor: 2,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4,
                  ),
                ),
              ),
              OutlinedButton.icon(
                onPressed: () => print('密码'),
                icon: Icon(Icons.lock_rounded),
                label: Text('密码登录'),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    EdgeInsets.only(
                      top: 12,
                      left: 88,
                      right: 88,
                      bottom: 12,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16, bottom: 32),
                child: OutlinedButton.icon(
                  onPressed: () => print('微信'),
                  icon: Icon(Icons.chat_rounded),
                  label: Text('微信登录'),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.only(
                        top: 12,
                        left: 88,
                        right: 88,
                        bottom: 12,
                      ),
                    ),
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(text: '登录即代表您已同意'),
                    TextSpan(
                      text: '《使用条款》',
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launch('https://github.com/');
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
