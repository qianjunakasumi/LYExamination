import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:lyexamination/messenger.dart';

import 'package:lyexamination/model/profile.dart';

import 'package:lyexamination/service/api.dart';
import 'package:lyexamination/service/hive.dart';

class FormComponent extends StatefulWidget {
  const FormComponent({Key? key}) : super(key: key);

  @override
  _FormComponentState createState() => _FormComponentState();
}

class _FormComponentState extends State<FormComponent> {
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

    final acc = AccountModel(phone, password);

    final APIService a = Get.find(tag: 'api');
    try {
      await a.loginAccount(acc);
    } on APIError catch (e) {
      Messenger.snackBar(e.message, feedback: e.feedback);
      return;
    } catch (e) {
      Messenger.snackBar(e.toString(), feedback: true);
      return;
    } finally {
      Messenger.completeProcess();
    }

    final HiveService h = Get.find(tag: 'hive');
    h.fileAccount(acc);

    Get.offNamed('/create/profile');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
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
      ),
    );
  }
}
