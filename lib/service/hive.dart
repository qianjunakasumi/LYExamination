import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lyexamination/model/profile.dart';

class HiveService extends GetxService {
  late final Box<dynamic> _accounts;
  late final Box<dynamic> _profiles;
  late final Box<dynamic> _currentProfile;

  Future<HiveService> init() async {
    await Hive.initFlutter();

    _accounts = await Hive.openBox('accounts');
    _profiles = await Hive.openBox('profiles');
    _currentProfile = await Hive.openBox('current_profile');

    return this;
  }

  //Box<dynamic> get profiles => _profiles;

  //Box<dynamic> get currentProfile => _currentProfile;

  /// ## 档案盒是空的吗
  bool isProfilesEmpty() {
    return _profiles.isEmpty;
  }

  /// ## 保存帐号
  void fileAccount(AccountModel a) {
    _accounts.put(a.phone, a.password);
  }

  /// ## 保存档案
  void fileProfile(ProfileModel p) {
    _profiles.add({
      'number': p.number,
      'name': p.name,
      'school': p.school,
      'grade': p.grade,
      'classNum': p.classNum
    });
  }
}
