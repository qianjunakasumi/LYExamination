//  Copyright (c) 2022 qianjunakasumi <i@qianjunakasumi.ren>
//                     qianjunakasumi <qianjunakasumi@outlook.com>
//                     [qianjunakasumi] 千橘雫霞(https://github.com/qianjunakasumi)
//
//       This Source Code Form is subject to the terms of the Mozilla Public
//       License, v. 2.0. If a copy of the MPL was not distributed with this
//       file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:hive_flutter/adapters.dart';

part 'std.g.dart';

@HiveType(typeId: 0)
class HiveRole {
  @HiveField(0)
  String phone;

  @HiveField(1)
  String id;

  @HiveField(2)
  String name;

  @HiveField(3)
  String school;

  @HiveField(4)
  String grade;

  @HiveField(5)
  String classNum;

  HiveRole({
    required this.id,
    required this.name,
    required this.school,
    required this.grade,
    required this.classNum,
    this.phone = '',
  });
}
