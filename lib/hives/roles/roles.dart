import 'package:hive_flutter/hive_flutter.dart';
import 'package:lyexamination/hives/hives.dart';
import 'package:lyexamination/hives/roles/std.dart';

Box<HiveRole> _hive() => Hive.box(hiveBoxRoles);

bool hiveRolesIsEmpty() => _hive().isEmpty;

HiveRole hiveRolesGetA(String id) => _hive().get(id)!;

Future<void> hiveRolesAddA(String id, HiveRole d) => _hive().put(id, d);
