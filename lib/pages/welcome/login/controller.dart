import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '/data/apis/accounts/login/std.dart';
import '/data/apis/exception/bad_respond.dart';
import '/data/hives/accounts/accounts.dart';
import '/messenger.dart';
import '/services/session.dart';

const loginFormControllerName = 'WelcomeLoginForm';

class LoginFormControllerValidateFailed implements Exception {}

class LoginFormController extends GetxController {
  final key = GlobalKey<FormState>();

  final SessionService s = Get.find();

  late String phone;
  late String password;

  Future<void> go() async {
    if (key.currentState!.validate() != true) {
      throw LoginFormControllerValidateFailed();
    }

    Messenger.process();
    key.currentState!.save();

    try {
      await s.loginWithAssignedAccount(APIAccountsLoginReq(phone, password));
    } on APIBadRespondException catch (e) {
      Messenger.snackBar(e.message, feedback: e.panic);
      rethrow;
    } finally {
      Messenger.completeProcess();
    }
  }

  void saveStatus() {
    hiveAccountsAddA(phone, password);
  }
}
