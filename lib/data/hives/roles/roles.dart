//  Copyright (c) 2022 qianjunakasumi <i@qianjunakasumi.ren>
//                     qianjunakasumi <qianjunakasumi@outlook.com>
//                     [qianjunakasumi] 千橘雫霞(https://github.com/qianjunakasumi)
//
//       This Source Code Form is subject to the terms of the Mozilla Public
//       License, v. 2.0. If a copy of the MPL was not distributed with this
//       file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:hive_flutter/hive_flutter.dart';

import '/data/hives/hives.dart';
import '/data/hives/roles/std.dart';

Box<HiveRole> _hive() => Hive.box(hiveBoxRoles);

bool hiveRolesIsEmpty() => _hive().isEmpty;

HiveRole hiveRolesGetA(String id) => _hive().get(id)!;

Future<void> hiveRolesAddA(String id, HiveRole d) => _hive().put(id, d);
