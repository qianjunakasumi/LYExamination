import 'package:lyexamination/apis/accounts/login/std.dart';
import 'package:lyexamination/apis/apis.dart';
import 'package:lyexamination/apis/exception/bad_respond.dart';

class APIAccountsLogin extends APIs with HTTPPost {
  final APIAccountsLoginReq req;
  late final APIAccountsLoginRsp rsp;

  static const url = '/Home/User/ajax_parlogin';

  APIAccountsLogin(this.req)
      : super(url, {'Login_phone': req.phone, 'parpwd': req.password});

  @override
  void parse() {
    rsp = APIAccountsLoginRsp.fromJSON(httpRSP.data);
  }

  @override
  void verify() {
    switch (rsp.status) {
      case 100:
        return;

      case 401: // 密码错误
      case 402: // 帐号未注册
        throw APIBadRespondException(httpRSP, '帐号或密码错误');

      default:
        throw APIBadRespondException(httpRSP, '无法理解的服务器响应。',
            panic: true, testament: rsp.message);
    }
  }
}
