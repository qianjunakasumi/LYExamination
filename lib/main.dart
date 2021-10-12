import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lyexamination/apis/service.dart';
import 'package:lyexamination/boot/pages.dart';
import 'package:lyexamination/boot/themes.dart';
import 'package:lyexamination/service/hive.dart';

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

    return this;
  }

  void setSystemUI() async {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
      Get.isDarkMode
          ? const SystemUiOverlayStyle(
              systemNavigationBarColor: Colors.transparent,
              systemNavigationBarDividerColor: Colors.transparent,
              systemNavigationBarIconBrightness: Brightness.light,
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
            )
          : const SystemUiOverlayStyle(
              systemNavigationBarColor: Colors.transparent,
              systemNavigationBarDividerColor: Colors.transparent,
              systemNavigationBarIconBrightness: Brightness.dark,
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    setSystemUI();
    final HiveService h = Get.find(tag: 'hive');

    return GetMaterialApp(
      title: '龙岩考试',
      initialRoute: h.isProfilesEmpty() ? '/welcome/login' : '/progress/login',
      theme: lightTheme,
      darkTheme: darkTheme,
      getPages: pages,
    );
  }
}
