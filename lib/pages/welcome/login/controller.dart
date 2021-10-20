import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lyexamination/data/apis/accounts/login/login.dart';
import 'package:lyexamination/data/apis/accounts/login/std.dart';
import 'package:lyexamination/data/apis/exception/bad_respond.dart';
import 'package:lyexamination/data/hives/accounts/accounts.dart';
import 'package:lyexamination/data/hives/settings/settings.dart';
import 'package:lyexamination/messenger.dart';

const loginFormControllerName = 'WelcomeLoginForm';

class LoginFormControllerValidateFailed implements Exception {}

class LoginFormController extends GetxController {
  final key = GlobalKey<FormState>();

  late String phone;
  late String password;

  Future<void> go() async {
    if (key.currentState!.validate() != true) {
      throw LoginFormControllerValidateFailed();
    }

    Messenger.process();
    key.currentState!.save();

    try {
      await _login();
    } finally {
      Messenger.completeProcess();
    }
  }

  void saveStatus() {
    hiveAccountsAddA(phone, password);
    hiveSettingsSetCurrentAccount(phone);
  }

  Future<void> _login() async {
    final a = APIAccountsLogin(APIAccountsLoginReq(phone, password));
    try {
      await a.wait();
    } on APIBadRespondException catch (e) {
      Messenger.snackBar(e.message, feedback: e.panic);
      rethrow;
    }
  }
}
