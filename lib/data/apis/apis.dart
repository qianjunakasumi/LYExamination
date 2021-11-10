import 'package:dio/dio.dart' as network;
import 'package:get/get.dart';
import 'package:lyexamination/data/apis/exception/bad_status.dart';

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
