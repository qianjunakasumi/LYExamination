import 'package:dio/dio.dart' as HTTP;
import 'package:get/get.dart';
import 'package:lyexamination/apis/exception/bad_status.dart';

class APIs {
  final HTTP.Dio http = Get.find(tag: 'api');

  final String _url;
  final Map<String, dynamic> httpREQ;

  APIs(this._url, this.httpREQ);

  late final HTTP.Response httpRSP;

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
  Future<void> fetch() async {
    httpRSP = await http.get(_url, queryParameters: httpREQ);
  }
}

mixin HTTPPost on APIs {
  Future<void> fetch() async {
    httpRSP = await http.post(_url, data: HTTP.FormData.fromMap(httpREQ));
  }
}
