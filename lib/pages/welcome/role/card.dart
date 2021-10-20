import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lyexamination/data/apis/accounts/roles/switch/std.dart';
import 'package:lyexamination/data/apis/accounts/roles/switch/switch.dart';
import 'package:lyexamination/data/hives/roles/roles.dart';
import 'package:lyexamination/data/hives/roles/std.dart';
import 'package:lyexamination/data/hives/settings/settings.dart';
import 'package:lyexamination/pages/welcome/role/std.dart';
import 'package:lyexamination/service.dart';

class CardComponent extends StatelessWidget {
  final CardComponentModel d;

  CardComponent(this.d, {Key? key}) : super(key: key);

  final AppGlobeService a = Get.find(tag: 'app');

  void save() async {
    await hiveRolesAddA(
      d.id,
      HiveRole(
        id: d.id,
        name: d.name,
        school: d.school,
        grade: d.grade,
        classNum: d.classNum,
        phone: hiveSettingsGetCurrentAccount(),
      ),
    );
    hiveSettingsSetDefaultRole(d.id);
    await APIACCNTsRolesSwitch(APIACCNTsRolesSwitchReq(d.id, d.name)).wait();
    Get.offAllNamed('/progress/login');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            info,
            TextButton(onPressed: () => save(), child: const Text('下一步')),
          ],
        ),
      ),
    );
  }

  Widget get info => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(d.name, style: a.theme.value.textTheme.headline4),
          const SizedBox(height: 8),
          Text('${d.school}  ${d.grade}（${d.classNum}）班',
              style: a.theme.value.textTheme.headline6),
          const SizedBox(height: 8),
          Text('学号：${d.id}', style: a.theme.value.textTheme.headline6),
        ],
      );
}
