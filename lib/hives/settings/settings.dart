import 'package:hive_flutter/adapters.dart';
import 'package:lyexamination/hives/hives.dart';
import 'package:lyexamination/hives/roles/std.dart';

HiveRole hiveSettingsGetDefaultRole() => Hive.box<HiveRole>(hiveBoxRoles).get(
      Hive.box(hiveBoxSettings).get('default_role'),
    )!;

HiveRole hiveSettingsGetCurrentRole() => Hive.box<HiveRole>(hiveBoxRoles).get(
      Hive.box(hiveBoxSettings).get('current_role'),
    )!;

Future<void> hiveSettingsSetCurrentAccount(String phone) =>
    Hive.box(hiveBoxSettings).put('current_account', phone);

Future<void> hiveSettingsSetCurrentRole(String id) =>
    Hive.box(hiveBoxSettings).put('current_role', id);

Future<void> hiveSettingsSetDefaultRole(String id) =>
    Hive.box(hiveBoxSettings).put('default_role', id);
