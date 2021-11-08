import 'package:get/get.dart';

import '/services/session.dart';

class HomeController extends GetxController {
  HomeController() {
    run();
  }

  final SessionService s = Get.find();

  void run() async {
    print('[LYEX] Call to login');

    /// b1
    try {
      await s.loginWithDefaultRole();
    } catch (e, s) {
      print(e);
      print(s);
      rethrow;
    }

    /// TODO 启动
    /// 检验本地是否存在已有的考试数据
    /// 若存在则加载本地考试数据
    /// 不存在则加载考试数据加载骨架 (null)
    ///
    ///
    /// b1. 登录并获取最新一场考试
    /// b2. 若当前的考试数据不是最新则提示是否切换
    /// b3. 若当前考试数据加载中则装载最新考试数据
  }
}
