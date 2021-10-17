import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lyexamination/apis/service.dart';
import 'package:lyexamination/boot/pages.dart';
import 'package:lyexamination/boot/themes.dart';
import 'package:lyexamination/hives/roles/roles.dart';
import 'package:lyexamination/hives/service.dart';
import 'package:lyexamination/service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(await const LYExaminationApp().init());
}

class LYExaminationApp extends StatelessWidget {
  const LYExaminationApp({Key? key}) : super(key: key);

  Future<LYExaminationApp> init() async {
    await Future.wait([
      Get.putAsync(() => APIService().init(), tag: 'api'),
      Get.putAsync(() => HiveService().init(), tag: 'hive'),
    ]);
    final a = Get.put(AppGlobeService(), tag: 'app');
    a.setSystemUI();

    WidgetsBinding.instance!.addObserver(AppWidgetsObserver());

    return this;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '龙岩考试',
      initialRoute: hiveRolesIsEmpty() ? '/welcome/login' : '/progress/login',
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
