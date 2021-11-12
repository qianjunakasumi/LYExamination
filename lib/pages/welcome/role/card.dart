import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/data/hives/roles/std.dart';
import '/pages/welcome/role/controller.dart';
import '../../../services/app_globe.dart';

class CardComponent extends StatelessWidget {
  final HiveRole d;

  CardComponent(this.d, {Key? key}) : super(key: key);

  final AppGlobeService a = Get.find();
  final RoleListController r = Get.find();

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
            TextButton(onPressed: () => r.go(d), child: const Text('下一步')),
          ],
        ),
      ),
    );
  }

  Widget get info => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(d.name, style: a.textTheme().headline4),
          const SizedBox(height: 8),
          Text('${d.school}  ${d.grade}（${d.classNum}）班',
              style: a.textTheme().headline6),
          const SizedBox(height: 8),
          Text('学号：${d.id}', style: a.textTheme().headline6),
        ],
      );
}
