import '/data/apis/accounts/roles/switch/std.dart';
import '/data/apis/apis.dart';

class APIACCNTsRolesSwitch extends APIs with HTTPPost {
  final APIACCNTsRolesSwitchReq req;

  static const url = '/Home/User/switchStudent';

  APIACCNTsRolesSwitch(this.req)
      : super(url, {'num': req.id, 'name': req.name});
}
