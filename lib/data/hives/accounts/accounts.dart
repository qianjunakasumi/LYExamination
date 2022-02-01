//  Copyright (c) 2022 qianjunakasumi <i@qianjunakasumi.ren>
//                     qianjunakasumi <qianjunakasumi@outlook.com>
//                     [qianjunakasumi] 千橘雫霞(https://github.com/qianjunakasumi)
//
//       This Source Code Form is subject to the terms of the Mozilla Public
//       License, v. 2.0. If a copy of the MPL was not distributed with this
//       file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:hive_flutter/hive_flutter.dart';

import '/data/hives/hives.dart';

String hiveAccountsGetPassword(String phone) =>
    Hive.box(hiveBoxAccounts).get(phone);

Future<void> hiveAccountsAddA(String phone, String password) =>
    Hive.box(hiveBoxAccounts).put(phone, password);

void hiveAccountsGetAll() {}
