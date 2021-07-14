import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lyexamination/messenger.dart';
import 'package:lyexamination/model/profile.dart';
import 'package:lyexamination/pages/create/_components/title.dart';
import 'package:lyexamination/service/profile.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final ProfileService profile = Get.find();
  final k = GlobalKey<FormState>();

  late String phone;
  late String password;

  void _onSubmit(BuildContext context) async {
    if (k.currentState!.validate() != true) {
      Messenger.snackBar('请按提示输入正确的内容');
      return;
    }

    Messenger.process();

    k.currentState!.save();

    final isOK = await profile.fileAccount(AccountModel(phone, password));

    Messenger.completeProcess();

    if (!isOK) {
      return;
    }

    Get.offNamed('/create/profile');
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
                onSaved: (v) => phone = v!,
                validator: (v) {
                  if (v!.isEmpty || v.length != 11) {
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
                onSaved: (v) => password = v!,
                validator: (v) {
                  if (v!.isEmpty || v.length < 6 || v.length > 20) {
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
