//  Copyright (c) 2022 qianjunakasumi <i@qianjunakasumi.ren>
//                     qianjunakasumi <qianjunakasumi@outlook.com>
//                     [qianjunakasumi] 千橘雫霞(https://github.com/qianjunakasumi)
//
//       This Source Code Form is subject to the terms of the Mozilla Public
//       License, v. 2.0. If a copy of the MPL was not distributed with this
//       file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '/src/data/hives/hives.dart';
import '/src/data/hives/roles/std.dart';

class HiveService extends GetxService {
  Future<HiveService> init() async {
    await Hive.initFlutter(
        (await getApplicationSupportDirectory()).path + '/hives/');

    Hive.registerAdapter(HiveRoleAdapter());

    await Future.wait([
      Hive.openBox(hiveBoxAccounts),
      Hive.openBox<HiveRole>(hiveBoxRoles),
      Hive.openBox(hiveBoxSettings),
    ]);

    return this;
  }
}
