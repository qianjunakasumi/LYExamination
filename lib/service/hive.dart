import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lyexamination/model/profile.dart';

class HiveService extends GetxService {
  late final Box<dynamic> _profiles;
  late final Box<dynamic> _settings;

  Future<HiveService> init() async {
    await Hive.initFlutter();

    _profiles = await Hive.openBox('profiles');
    _settings = await Hive.openBox('settings');

    return this;
  }

  /// ## 档案盒是空的吗
  bool isProfilesEmpty() {
    return _profiles.isEmpty;
  }

  /// ## 设置登录帐号信息
  void setLoginInfo(AccountModel a) {
    _settings.putAll({
      'current_phone': a.phone,
      'current_password': a.password,
    });
  }

  /// ## 保存档案
  /// 返回值：键
  Future<int> fileProfile(ProfileModel p) async {
    p.phone = _settings.get('current_phone');
    p.password = _settings.get('current_password');
    return await _profiles.add(p.toHiveJson());
  }

  /// ## 设置默认档案
  void setDefaultProfile(int k) {
    _settings.put('default_profile', k);
  }

  /// ## 获取档案
  ProfileModel _getProfile(int k) {
    final Map p = _profiles.get(k);
    return ProfileModel.fromHive(p);
  }

  /// ## 获取默认档案
  ProfileModel getDefaultProfile() {
    final int? k = _settings.get('default_profile');
    if (k == null) {
      throw '无法获取默认档案键值';
    }

    return _getProfile(k);
  }

  /// ## 获取当前档案
  ProfileModel getCurrentProfile() {
    final int? k = _settings.get('current_profile');
    if (k == null) {
      return getDefaultProfile();
    }

    return _getProfile(k);
  }

  void fileExamList(List<ExamAbstractModel> es) {
    es.forEach((e) {
      _exams.put(e.id, {'name': e.name, 'date': e.date});
    });
  }
}
