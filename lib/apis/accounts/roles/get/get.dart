import 'package:lyexamination/apis/accounts/roles/get/std.dart';
import 'package:lyexamination/apis/apis.dart';

class APIACCNTsRolesGet extends APIs with HTTPGet {
  final APIACCNTsRolesGetReq req;
  late final APIACCNTsRolesGetRsp rsp;

  static const url =
      'https://mic.fjjxhl.com/Jx/index.php/Home/User/ajax_SelectStudent_upCallback';

  APIACCNTsRolesGet(this.req) : super(url, {'size': req.length});

  @override
  void parse() {
    rsp = APIACCNTsRolesGetRsp.fromJSON(httpRSP.data);
  }
}
