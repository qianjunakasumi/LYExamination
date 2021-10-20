import 'package:get/get.dart';
import 'package:lyexamination/data/apis/exception/bad_respond.dart';
import 'package:lyexamination/pages/welcome/login/controller.dart';
import 'package:lyexamination/pages/welcome/role/controller.dart';

class WelcomeController extends GetxController {
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
