import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lyexamination/apis/accounts/login/login.dart';
import 'package:lyexamination/apis/accounts/login/std.dart';
import 'package:lyexamination/apis/exception/bad_respond.dart';
import 'package:lyexamination/messenger.dart';
import 'package:lyexamination/model/profile.dart';
import 'package:lyexamination/service/hive.dart';

class LoginFormController extends GetxController {
  final key = GlobalKey<FormState>();

  late String phone;
  late String password;

  void go() async {
    if (key.currentState!.validate() != true) {
      return;
    }

    Messenger.process();
    key.currentState!.save();

    try {
      await login();
    } on APIBadRespondException catch (e) {
      Messenger.snackBar(e.message, feedback: e.panic);
      //if (e.panic) rethrow; panic 应进入 Error 页面
      return;
    } catch (e) {
      Messenger.snackBar(e.toString(), feedback: true);
      return;
    } finally {
      Messenger.completeProcess();
    }

    final HiveService h = Get.find(tag: 'hive');
    h.setLoginInfo(AccountModel(phone, password));

    // 身为独立的控制器不应该这样，计划日后改进
    Get.toNamed('/create/profile');
  }

  Future<void> login() async {
    final a = APIAccountsLogin(APIAccountsLoginReq(phone, password));
    await a.wait();
  }
}
