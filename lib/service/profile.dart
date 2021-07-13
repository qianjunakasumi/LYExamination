import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:lyexamination/boot/network.dart';
import 'package:lyexamination/boot/shared_preferences.dart';
import 'package:lyexamination/messenger.dart';
import 'package:lyexamination/model/profile.dart';

class ProfileService extends GetxService {
  var profileList = [].obs;

  /// ## 保存帐号
  /// 返回值释义：保存成功与否
  Future<bool> fileAccount(AccountModel a) async {
    if (!await loginAccount(a)) {
      return false;
    }

    prefs.setString(a.phone, a.password);

    return true;
  }

  Future<void> addProfile(ProfileModel p) async {
  }

  /// ## 拉取远程档案
  /// 返回值释义：拉取成功与否
  Future<bool> fetchProfileFromRemote() async {
    late dio.Response<dynamic> rsp;
    try {
      rsp = await http.get(
        'https://mic.fjjxhl.com/Jx/index.php/Home/User/ajax_SelectStudent_upCallback',
        queryParameters: {
          'size': 1024,
        },
      );
    } catch (e) {
      Messenger.snackBar(e.toString(), feedback: true);
    }

    final d = rsp.data['rows'];
    if (d == null) {
      Messenger.snackBar('您还没有在龙岩家校中绑定学生', feedback: true);
      return false;
    }

    List<ProfileModel> profiles = [];

    for (var p in d) {
      profiles.add(ProfileModel(
          p['unum'], p['stuname'], p['school'], p['grade'], p['class']));
    }

    profileList.value = profiles;
    return true;
  }

  /// ## 登录帐号
  /// 返回值释义：登录成功与否
  Future<bool> loginAccount(AccountModel a) async {
    late dio.Response<dynamic> rsp;
    try {
      rsp = await http.post(
        'https://mic.fjjxhl.com/pcnews/index.php/Home/User/parlogin',
        data: dio.FormData.fromMap({
          'Login_phone': a.phone,
          'parpwd': a.password,
        }),
      );
    } catch (e) {
      Messenger.snackBar(e.toString(), feedback: true);
    }

    final msg = rsp.data['msg'];

    switch (msg) {
      case 'ok':
        Messenger.snackBar('登录成功');
        return true;

      case 'mimacuowu':
        Messenger.snackBar('错误的密码');
        break;

      case 'shangweizhuce':
        Messenger.snackBar('错误的帐号');
        break;

      default:
        Messenger.snackBar('未知错误。原始消息：' + msg, feedback: true);
    }

    return false;
  }
}
