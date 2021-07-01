import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreatePage extends StatelessWidget {
  final _k = GlobalKey<FormState>();

  String _phone;
  String _pwd;

  void _onSubmit() async {
    if (_k.currentState.validate() != true) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 64),
        Text(
          '欢迎登录',
          textScaleFactor: 2.16,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 24),
        Divider(),
        SizedBox(height: 24),
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
        Form(
          key: _k,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: '手机号'),
                keyboardType: TextInputType.number,
                autofocus: true,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onSaved: (v) => _phone = v,
                validator: (v) {
                  if (v.isEmpty || v.length != 11) {
                    return '请输入有效的手机号';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: '密码'),
                obscureText: true,
                onSaved: (v) => _pwd = v,
                validator: (v) {
                  if (v.isEmpty || v.length < 6 || v.length > 20) {
                    return '请输入有效的密码';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _onSubmit(),
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
                      child: Text('登录'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
