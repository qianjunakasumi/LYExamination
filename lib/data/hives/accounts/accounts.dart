import 'package:hive_flutter/hive_flutter.dart';
import 'package:lyexamination/data/hives/hives.dart';

String hiveAccountsGetPassword(String phone) =>
    Hive.box(hiveBoxAccounts).get(phone);

Future<void> hiveAccountsAddA(String phone, String password) =>
    Hive.box(hiveBoxAccounts).put(phone, password);

void hiveAccountsGetAll() {}
