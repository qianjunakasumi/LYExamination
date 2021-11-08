import 'package:hive_flutter/adapters.dart';
import 'package:lyexamination/data/hives/hives.dart';
import 'package:lyexamination/data/hives/roles/std.dart';

Box<dynamic> get box => Hive.box(hiveBoxSettings);

HiveRole hiveSettingsGetDefaultRole() => Hive.box<HiveRole>(hiveBoxRoles).get(
      Hive.box(hiveBoxSettings).get('default_role'),
    )!;

Future<void> hiveSettingsSetDefaultRole(String id) =>
    Hive.box(hiveBoxSettings).put('default_role', id);

class HiveSettingsSession {
  static const name = 'session_expire';

  static DateTime get expire => box.get(name);

  static set expire(DateTime d) => box.put(name, d);
}
