import 'package:get/get.dart';
import 'package:lyexamination/apis/exception/bad_respond.dart';
import 'package:lyexamination/controllers/welcome/login.dart';
import 'package:lyexamination/controllers/welcome/role.dart';
import 'package:lyexamination/hives/roles/std.dart';

class WelcomeController extends GetxController {
  late HiveRole roles;

  final lc = Get.put(LoginFormController(), tag: loginFormControllerName);
  final rc = Get.put(RoleListController(), tag: roleListControllerName);

  void go() async {
    try {
      await lc.go();
    } on LoginFormControllerValidateFailed {
      return;
    } on APIBadRespondException {
      return;
    }
    lc.saveStatus();
    rc.fetch();
    Get.toNamed('/welcome/role');
  }
}
