import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lyexamination/apis/accounts/login/login.dart';
import 'package:lyexamination/apis/accounts/login/std.dart';
import 'package:lyexamination/apis/exception/bad_respond.dart';
import 'package:lyexamination/hives/accounts/accounts.dart';
import 'package:lyexamination/hives/settings/settings.dart';
import 'package:lyexamination/messenger.dart';

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
      rethrow;
    } finally {
      Messenger.completeProcess();
    }

    hiveAccountsAddA(phone, password);
    hiveSettingsSetCurrentAccount(phone);

    // 身为独立的控制器不应该这样，计划日后改进
    Get.toNamed('/create/profile');
  }

  Future<void> login() async {
    final a = APIAccountsLogin(APIAccountsLoginReq(phone, password));
    await a.wait();
  }
}
