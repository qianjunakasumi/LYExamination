//  Copyright (c) 2022 qianjunakasumi <i@qianjunakasumi.ren>
//                     qianjunakasumi <qianjunakasumi@outlook.com>
//                     [qianjunakasumi] 千橘雫霞(https://github.com/qianjunakasumi)
//
//       This Source Code Form is subject to the terms of the Mozilla Public
//       License, v. 2.0. If a copy of the MPL was not distributed with this
//       file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:get/get.dart';

import '/pages/home/home.dart';
import '/pages/welcome/login/login.dart';
import '/pages/welcome/role/role.dart';

List<GetPage> get pages => [
      GetPage(
        name: '/home',
        page: () => HomeLayout(),
      ),
      GetPage(
        name: '/welcome/login',
        page: () => WelcomeLoginPage(),
      ),
      GetPage(
        name: '/welcome/role',
        page: () => WelcomeRolePage(),
      ),
    ];
