//  Copyright (c) 2022 qianjunakasumi <i@qianjunakasumi.ren>
//                     qianjunakasumi <qianjunakasumi@outlook.com>
//                     [qianjunakasumi] 千橘雫霞(https://github.com/qianjunakasumi)
//
//       This Source Code Form is subject to the terms of the Mozilla Public
//       License, v. 2.0. If a copy of the MPL was not distributed with this
//       file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:dio/dio.dart' as network;
import 'package:get/get.dart';

import '/src/data/apis/exception/bad_status.dart';

class APIs {
  final network.Dio http = Get.find();

  final String _url;
  final Map<String, dynamic> httpREQ;

  APIs(this._url, this.httpREQ);

  late final network.Response httpRSP;

  Future<void> fetch() async {}

  void check() {
    if (httpRSP.statusCode != 200) throw APIBadStatusException(httpRSP);
  }

  void parse() {}

  void verify() {}

  Future<void> wait() async {
    await fetch();
    check();
    parse();
    verify();
  }
}

mixin HTTPGet on APIs {
  @override
  Future<void> fetch() async {
    httpRSP = await http.get(_url, queryParameters: httpREQ);
  }
}

mixin HTTPPost on APIs {
  @override
  Future<void> fetch() async {
    httpRSP = await http.post(_url, data: network.FormData.fromMap(httpREQ));
  }
}
