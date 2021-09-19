import 'package:lyexamination/apis/accounts/roles/switch/std.dart';
import 'package:lyexamination/apis/apis.dart';

class APIACCNTsRolesSwitch extends APIs with HTTPPost {
  final APIACCNTsRolesSwitchReq req;

  static const url =
      'https://mic.fjjxhl.com/Jx/index.php/Home/User/switchStudent';

  APIACCNTsRolesSwitch(this.req)
      : super(url, {'num': req.id, 'name': req.name});
}
