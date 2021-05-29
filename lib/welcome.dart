import 'package:flutter/material.dart';
import 'package:lyexamination/dao/student.dart';
import 'package:lyexamination/model/database/table/student.dart';
import 'package:lyexamination/route/terms.dart';

class WelcomePage extends StatelessWidget {
  void _skip(BuildContext context, List<Student> stu) {
    if (stu.length != 0) {
      // Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      // TODO 登录
    }
  }

  void _next(BuildContext context, String m) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) => TermsPage(m)),
    );
  }

  final ButtonStyle _btnStyle = ButtonStyle(
    elevation: MaterialStateProperty.all(0),
    padding: MaterialStateProperty.all(
      EdgeInsets.only(top: 12, left: 32, right: 16, bottom: 12),
    ),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    retrieveStudents().then((stu) => _skip(context, stu));

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/background/welcome.png', width: 264),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => _next(context, 'password'),
                style: _btnStyle,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 216),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.lock_outline_rounded),
                          Text(
                            '密码登录',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.keyboard_arrow_right_outlined),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12),
              OutlinedButton(
                onPressed: () => _next(context, 'wechat'),
                style: _btnStyle,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 216),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/icons/wechat.png',
                            width: 24,
                            height: 24,
                          ),
                          Text('微信登录'),
                        ],
                      ),
                      Icon(Icons.keyboard_arrow_right_outlined),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
