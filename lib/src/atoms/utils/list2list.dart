//  Copyright (c) 2022 qianjunakasumi <i@qianjunakasumi.ren>
//                     qianjunakasumi <qianjunakasumi@outlook.com>
//                     [qianjunakasumi] 千橘雫霞(https://github.com/qianjunakasumi)
//
//       This Source Code Form is subject to the terms of the Mozilla Public
//       License, v. 2.0. If a copy of the MPL was not distributed with this
//       file, You can obtain one at http://mozilla.org/MPL/2.0/.

typedef LMap = Map<String, dynamic>;

List<T> list2List<S, T>(List<S> s, T Function(S) f) {
  List<T> t = [];
  for (final e in s) {
    t.add(f(e));
  }
  return t;
}

List<T> dynamicList2List<T>(List<dynamic> s, T Function(dynamic) f) =>
    list2List<dynamic, T>(s, f);
