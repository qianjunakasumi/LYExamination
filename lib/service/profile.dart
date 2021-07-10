import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:lyexamination/boot/network.dart';
import 'package:lyexamination/messenger.dart';
import 'package:lyexamination/model/profile.dart';

class ProfileService extends ChangeNotifier {
  void fileAccount(AccountModel a) async {
    await loginAccount(a);

    // TODO 保存帐号到数据库

    // TODO 跳转至身份选择页面
  }

  void loginAccount(AccountModel a) async {
    Response<dynamic> rsp;
    try {
      rsp = await http.post(
        'https://mic.fjjxhl.com/pcnews/index.php/Home/User/parlogin',
        data: FormData.fromMap({
          'Login_phone': a.phone,
          'parpwd': a.password,
        }),
      );
    } catch (e) {
      Messenger().snackBar(e, feedback: true);
    }

    final msg = rsp.data['msg'];

    switch (msg) {
      case 'ok':
        Messenger().snackBar('登录成功');
        // TODO 获取 session
        break;

      case 'mimacuowu':
        Messenger().snackBar('错误的密码');
        break;

      case 'shangweizhuce':
        Messenger().snackBar('错误的帐号');
        break;

      default:
        Messenger().snackBar('未知错误。原始消息：' + msg, feedback: true);
    }
  }
}
