import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lyexamination/hives/hives.dart';
import 'package:lyexamination/hives/roles/std.dart';
import 'package:path_provider/path_provider.dart';

class HiveService extends GetxService {
  Future<HiveService> init() async {
    await Hive.initFlutter(
        (await getApplicationSupportDirectory()).path + '/hives/');

    Hive.registerAdapter(HiveRoleAdapter());

    await Future.wait([
      Hive.openBox(hiveBoxAccounts),
      Hive.openBox<HiveRole>(hiveBoxRoles),
      Hive.openBox(hiveBoxSettings),
    ]);

    return this;
  }
}
