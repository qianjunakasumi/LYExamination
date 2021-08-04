import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:get/get.dart' as Get;
import 'package:lyexamination/model/profile.dart';

class APIService extends Get.GetxService {
  final Dio _dio = Dio();
  final CookieJar _cookieJar = CookieJar();

  APIService() {
    _dio.interceptors.add(CookieManager(_cookieJar));
  }

  /// ## 登录帐号
  Future<void> loginAccount(AccountModel a) async {
    final Response rsp = await _dio.post(
      'https://mic.fjjxhl.com/pcnews/index.php/Home/User/parlogin',
      data: FormData.fromMap({
        'Login_phone': a.phone,
        'parpwd': a.password,
      }),
    );

    final msg = rsp.data['msg'];

    switch (msg) {
      case 'ok':
        return;

      case 'mimacuowu':
        throw APIError('错误的密码', false);

      case 'shangweizhuce':
        throw APIError('错误的帐号', false);

      default:
        throw APIError('未知错误。原始消息：' + msg, true);
    }
  }

  /// ## 获取档案
  Future<List<ProfileModel>> fetchProfiles() async {
    final Response rsp = await _dio.get(
      'https://mic.fjjxhl.com/Jx/index.php/Home/User/ajax_SelectStudent_upCallback',
      queryParameters: {'size': 1024},
    );

    print(rsp.data);

    final d = rsp.data['rows'];
    if (d == null) {
      throw APIError('您还没有在龙岩家校中绑定学生', false);
    }

    List<ProfileModel> profiles = [];

    for (var p in d) {
      profiles.add(ProfileModel(
          p['unum'], p['stuname'], p['school'], p['grade'], p['class']));
    }

    return profiles;
  }
}

/// ## API 错误
class APIError {
  final String message;
  final bool feedback;

  APIError(this.message, this.feedback);
}
