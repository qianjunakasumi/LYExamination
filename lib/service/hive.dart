import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lyexamination/model/profile.dart';

class HiveService extends GetxService {
  late final Box<dynamic> _accounts;
  late final Box<dynamic> _profiles;
  late final Box<dynamic> _settings;

  Future<HiveService> init() async {
    await Hive.initFlutter();

    _accounts = await Hive.openBox('accounts');
    _profiles = await Hive.openBox('profiles');
    _settings = await Hive.openBox('settings');

    return this;
  }

  /// ## 档案盒是空的吗
  bool isProfilesEmpty() {
    return _profiles.isEmpty;
  }

  /// ## 保存帐号
  void fileAccount(AccountModel a) {
    _accounts.put(a.phone, a.password);
  }

  /// ## 保存档案
  /// 返回值：键
  Future<int> fileProfile(ProfileModel p) async {
    return await _profiles.add({
      'number': p.number,
      'name': p.name,
      'school': p.school,
      'grade': p.grade,
      'classNum': p.classNum
    });
  }

  /// ## 设置默认档案
  void setDefaultProfile(int k) {
    _settings.put('default_profile', k);
  }

  /// ## 获取默认档案
  ProfileModel getDefaultProfile() {
    final int? key = _settings.get('default_profile');
    if (key == null) {
      throw '无法获取默认档案键值';
    }

    final Map profile = _profiles.get(key);

    return ProfileModel(
      profile['number'],
      profile['name'],
      profile['school'],
      profile['grade'],
      profile['classNum'],
    );
  }

  /// ## 获取当前档案
  ProfileModel getCurrentProfile() {
    final int? key = _settings.get('current_profile');
    if (key == null) {
      return getDefaultProfile();
    }

    // TODO 返回当前的档案
    return ProfileModel('number', 'name', 'school', 'grade', 'classNum');
  }
}