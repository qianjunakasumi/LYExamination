import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lyexamination/messenger.dart';
import 'package:lyexamination/model/profile.dart';
import 'package:lyexamination/pages/create/_components/title.dart';
import 'package:lyexamination/service/profile.dart';
import 'package:provider/provider.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final k = GlobalKey<FormState>();

  AccountModel a = AccountModel();

  void _onSubmit(BuildContext context) async {
    if (k.currentState.validate() != true) {
      Messenger.snackBar('请按提示输入正确的内容');
      return;
    }

    Messenger.process();

    k.currentState.save();

    final isOK = await Provider.of<ProfileService>(context, listen: false)
        .fileAccount(a);

    Messenger.completeProcess();

    if (!isOK) {
      return;
    }

    Messenger.navigator().pushReplacementNamed('/create/profile');
  }

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
        Form(
          key: k,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: '手机号'),
                keyboardType: TextInputType.number,
                autofocus: true,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onSaved: (v) => a.phone = v,
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
                onSaved: (v) => a.password = v,
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
