import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:lyexamination/boot/snackbar.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final _k = GlobalKey<FormState>();

  String _phone;
  String _pwd;

  void _onSubmit(BuildContext context) async {
    if (_k.currentState.validate() != true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('请按提示输入正确的内容')),
      );
      return;
    }

    _k.currentState.save();

    final rsp = await http.post(
      Uri.parse('https://mic.fjjxhl.com/pcnews/index.php/Home/User/parlogin'),
      body: <String, String>{
        'Login_phone': _phone.toString(),
        'parpwd': _pwd,
      },
    );

    final msg = json.decode(rsp.body)['msg'] as String;

    switch (msg) {
      case 'ok':
        showSnackBar(context, '登录成功');
        break;

      case 'mimacuowu':
        showSnackBar(context, '错误的密码');
        break;

      case 'shangweizhuce':
        showSnackBar(context, '错误的帐号');
        break;

      default:
        showSnackBarWithFeedback(context, '未知错误。原始消息：' + msg);
    }
    // TODO 获取 session

    // TODO 保存帐号到数据库

    // TODO 跳转至身份选择页面
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
            ],
          ),
        ),
        SizedBox(height: 32),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () => _onSubmit(context),
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
    );
  }
}
