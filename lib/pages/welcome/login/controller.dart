import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '/data/apis/accounts/login/std.dart';
import '/data/apis/exception/bad_respond.dart';
import '/data/hives/accounts/accounts.dart';
import '/services/session.dart';
import '/utils.dart';

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

    process();
    key.currentState!.save();

    try {
      await s.loginWithAssignedAccount(APIAccountsLoginReq(phone, password));
    } on APIBadRespondException catch (e) {
      snack(e.message, feedback: e.panic);
      rethrow;
    } finally {
      complete();
    }
  }

  void saveStatus() {
    hiveAccountsAddA(phone, password);
  }
}
