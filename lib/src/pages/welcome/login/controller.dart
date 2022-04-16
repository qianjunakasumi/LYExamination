//  Copyright (c) 2022 qianjunakasumi <i@qianjunakasumi.ren>
//                     qianjunakasumi <qianjunakasumi@outlook.com>
//                     [qianjunakasumi] 千橘雫霞(https://github.com/qianjunakasumi)
//
//       This Source Code Form is subject to the terms of the Mozilla Public
//       License, v. 2.0. If a copy of the MPL was not distributed with this
//       file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '/src/atoms/controller/snackbar.dart';
import '/src/atoms/controller/processing.dart';
import '/src/data/apis/accounts/login/std.dart';
import '/src/data/apis/exception/bad_respond.dart';
import '/src/data/hives/accounts/accounts.dart';
import '/src/services/session.dart';

const loginFormControllerName = 'WelcomeLoginForm';

class LoginFormControllerValidateFailed implements Exception {}

class LoginFormController extends GetxController {
  final key = GlobalKey<FormState>();

  final SessionService s = Get.find();
  final sn = Get.put(SnackbarCTR());

  late String phone;
  late String password;

  Future<void> go() async {
    if (key.currentState!.validate() != true) {
      throw LoginFormControllerValidateFailed();
    }

    final p = Get.put(ProcessingCTR());
    p.create();
    key.currentState!.save();

    try {
      await s.loginWithAssignedAccount(APIAccountsLoginReq(phone, password));
    } on APIBadRespondException catch (e) {
      sn.createWithFeedback(e.message);
      rethrow;
    } finally {
      p.close();
    }
  }

  void saveStatus() {
    hiveAccountsAddA(phone, password);
  }
}
