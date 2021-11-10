import 'package:get/get.dart';

import '/data/apis/accounts/roles/get/get.dart';
import '/data/apis/accounts/roles/get/std.dart';
import '/data/hives/roles/roles.dart';
import '/data/hives/roles/std.dart';
import '/data/hives/settings/settings.dart';
import '/services/session.dart';
import '/utils.dart';

class RoleListController extends GetxController {
  final SessionService s = Get.find();

  var role = <HiveRole>[].obs;

  Future<void> fetch() async {
    final a = APIACCNTsRolesGet(const APIACCNTsRolesGetReq());
    await a.wait();

    role.value = list2List<APIACCNTsRolesGetRRData, HiveRole>(
      a.rsp.roles,
      (e) => HiveRole(
        id: e.id,
        name: e.name,
        school: e.school,
        grade: e.grade,
        classNum: e.c,
        phone: s.phone,
      ),
    );
  }

  Future<void> go(HiveRole r) async {
    await hiveRolesAddA(r.id, r);
    hiveSettingsSetDefaultRole(r.id);
    await s.assigningRole(r);
    Get.offAllNamed('/home');
  }
}
