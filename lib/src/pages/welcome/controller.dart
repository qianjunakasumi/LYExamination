//  Copyright (c) 2022 qianjunakasumi <i@qianjunakasumi.ren>
//                     qianjunakasumi <qianjunakasumi@outlook.com>
//                     [qianjunakasumi] 千橘雫霞(https://github.com/qianjunakasumi)
//
//       This Source Code Form is subject to the terms of the Mozilla Public
//       License, v. 2.0. If a copy of the MPL was not distributed with this
//       file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:get/get.dart';

import '/src/data/apis/exception/bad_respond.dart';
import '/src/pages/welcome/login/controller.dart';
import '/src/pages/welcome/role/controller.dart';

class WelcomeController extends GetxController {
  final lc = Get.put(LoginFormController(), tag: loginFormControllerName);
  final rc = Get.put(RoleListController());

  void go() async {
    try {
      await lc.go();
    } on LoginFormControllerValidateFailed {
      return;
    } on APIBadRespondException {
      return;
    }
    lc.saveStatus();
    rc.fetch();
    Get.toNamed('/welcome/role');
  }
}
