//  Copyright (c) 2022 qianjunakasumi <i@qianjunakasumi.ren>
//                     qianjunakasumi <qianjunakasumi@outlook.com>
//                     [qianjunakasumi] 千橘雫霞(https://github.com/qianjunakasumi)
//
//       This Source Code Form is subject to the terms of the Mozilla Public
//       License, v. 2.0. If a copy of the MPL was not distributed with this
//       file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:hive_flutter/adapters.dart';

import '/src/data/hives/hives.dart';
import '/src/data/hives/roles/std.dart';

Box<dynamic> get box => Hive.box(hiveBoxSettings);

HiveRole hiveSettingsGetDefaultRole() => Hive.box<HiveRole>(hiveBoxRoles).get(
      Hive.box(hiveBoxSettings).get('default_role'),
    )!;

Future<void> hiveSettingsSetDefaultRole(String id) =>
    Hive.box(hiveBoxSettings).put('default_role', id);

class HiveSettingsSession {
  static const name = 'session_expire';

  static DateTime get expire => box.get(name);

  static set expire(DateTime d) => box.put(name, d);
}
