import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/boot/pages.dart';
import '/boot/themes.dart';
import '/data/apis/service.dart';
import '/data/hives/roles/roles.dart';
import '/data/hives/service.dart';
import '/pages/home/controller.dart';
import '/service.dart';
import '/services/session.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(await LYExaminationApp.run());
}

class LYExaminationApp extends StatelessWidget {
  static Future<LYExaminationApp> run() async {
    await Future.wait([
      Get.putAsync(() => APIService().init(), tag: 'api'),
      Get.putAsync(() => HiveService().init(), tag: 'hive'),
    ]);
    Get.put(SessionService());
    Get.put(AppGlobeService(), tag: 'app').setSystemUI();

    WidgetsBinding.instance!.addObserver(AppWidgetsObserver());

    return !hiveRolesIsEmpty()
        ? rise()
        : const LYExaminationApp(route: '/welcome/login');
  }

  static LYExaminationApp rise() {
    Get.put(HomeController());
    return const LYExaminationApp();
  }

  final String route;

  const LYExaminationApp({this.route = '/home', Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '龙岩考试',
      initialRoute: route,
      theme: lightTheme,
      darkTheme: darkTheme,
      getPages: pages,
    );
  }
}

class AppWidgetsObserver with WidgetsBindingObserver {
  @override
  void didChangePlatformBrightness() {
    final AppGlobeService a = Get.find(tag: 'app');
    a.changeTheme();
  }
}
