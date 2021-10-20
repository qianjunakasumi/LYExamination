import 'package:get/get.dart';
import 'package:lyexamination/apis/accounts/roles/get/get.dart';
import 'package:lyexamination/apis/accounts/roles/get/std.dart';
import 'package:lyexamination/pages/welcome/role/std.dart';

const roleListControllerName = 'WelcomeRoleList';

class RoleListController extends GetxController {
  var role = <CardComponentModel>[].obs;

  Future<void> fetch() async {
    final a = APIACCNTsRolesGet(const APIACCNTsRolesGetReq());
    await a.wait();

    List<CardComponentModel> l = [];
    for (var e in a.rsp.roles) {
      l.add(CardComponentModel(
        id: e.id,
        name: e.name,
        school: e.school,
        grade: e.grade,
        classNum: e.c,
      ));
    }
    role.value = l;
  }
}
