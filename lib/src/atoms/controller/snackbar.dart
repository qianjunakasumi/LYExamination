//  Copyright (c) 2022 qianjunakasumi <i@qianjunakasumi.ren>
//                     qianjunakasumi <qianjunakasumi@outlook.com>
//                     [qianjunakasumi] 千橘雫霞(https://github.com/qianjunakasumi)
//
//       This Source Code Form is subject to the terms of the Mozilla Public
//       License, v. 2.0. If a copy of the MPL was not distributed with this
//       file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SnackbarCTR extends GetxController {
  void _display(SnackBar s) =>
      ScaffoldMessenger.of(Get.context!).showSnackBar(s);

  void create(String m) => _display(SnackBar(content: Text(m)));

  void createWithFeedback(String m) => _display(
        SnackBar(
          content: Text(m),
          action: SnackBarAction(
            label: '发送反馈',
            onPressed: () => launch(
              'mqqopensdkapi://bizAgent/qm/qr?url=http%3A%2F%2Fqm.qq.com%2Fcgi-bin%2Fqm%2Fqr%3Ffrom%3Dapp%26p%3Dandroid%26jump_from%3Dwebapi%26k%3DWXvwr8_hrPRtDQv7lCiRKoi63lK0tbGe',
            ),
          ),
        ),
      );
}
