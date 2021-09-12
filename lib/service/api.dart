import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:get/get.dart' as Get;
import 'package:lyexamination/model/exam.dart';
import 'package:lyexamination/model/profile.dart';

class APIService extends Get.GetxService {
  final Dio _dio = Dio();
  final CookieJar _cookieJar = PersistCookieJar(ignoreExpires: true);

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
        throw APIError('错误的密码');

      case 'shangweizhuce':
        throw APIError('错误的帐号');

      default:
        throw APIError('未知错误。原始消息：' + msg, feedback: true);
    }
  }

  /// ## 获取档案
  Future<List<ProfileModel>> fetchProfiles() async {
    final Response rsp = await _dio.get(
      'https://mic.fjjxhl.com/Jx/index.php/Home/User/ajax_SelectStudent_upCallback',
      queryParameters: {'size': 1024},
    );

    final List? d = rsp.data['rows'];
    if (d == null) {
      throw APIError('您还没有在龙岩家校中绑定学生');
    }

    List<ProfileModel> profiles = [];

    d.forEach((p) {
      profiles.add(ProfileModel(
        p['unum'],
        p['stuname'],
        p['school'],
        p['grade'],
        p['class'],
      ));
    });

    return profiles;
  }

  /// ## 切换档案
  Future<void> switchProfile(ProfileModel p) async {
    await _dio.post(
      'https://mic.fjjxhl.com/Jx/index.php/Home/User/switchStudent',
      data: FormData.fromMap({
        'num': p.number,
        'name': p.name,
      }),
    );
  }

  /// ## 获取考试列表
  Future<List<ExamInfoModel>> fetchExamList({int range = 114514}) async {
    final Response rsp = await _dio.get(
      'https://mic.fjjxhl.com/Jx/index.php/Home/Achievement/ajax_showmark_upCallback',
      queryParameters: {'size': range},
    );

    final int count = rsp.data['count'];
    if (count < 1) {
      throw APIError('没有历次考试数据');
    }

    var es = <ExamInfoModel>[];

    final List o = rsp.data['title'];
    o.forEach((e) {
      es.add(ExamInfoModel(
        e['id'],
        e['name'],
        DateTime.parse(e['cdate']),
      ));
    });

    return es;
  }
}

/// ## API 错误
class APIError {
  final String message;
  final bool feedback;

  APIError(this.message, {this.feedback = false});

  @override
  String toString() {
    return message;
  }
}
