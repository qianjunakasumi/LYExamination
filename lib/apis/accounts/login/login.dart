import 'package:lyexamination/apis/accounts/login/std.dart';
import 'package:lyexamination/apis/apis.dart';
import 'package:lyexamination/apis/exception/bad_respond.dart';

class APIAccountsLogin extends APIs with HTTPPost {
  final APIAccountsLoginReq req;
  late final APIAccountsLoginRsp rsp;

  static const url =
      'https://mic.fjjxhl.com/pcnews/index.php/Home/User/parlogin';

  APIAccountsLogin(this.req)
      : super(url, {'Login_phone': req.phone, 'parpwd': req.password});

  @override
  void parse() {
    rsp = APIAccountsLoginRsp.fromJSON(httpRSP.data);
  }

  @override
  void verify() {
    switch (rsp.message) {
      case 'ok':
        return;

      case 'mimacuowu':
      case 'shangweizhuce':
        throw APIBadRespondException(httpRSP, '帐号或密码错误');

      default:
        throw APIBadRespondException(httpRSP, '无法理解的服务器响应。',
            panic: true, testament: rsp.message);
    }
  }
}
