import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lyexamination/boot/pages.dart';
import 'package:lyexamination/boot/themes.dart';
import 'package:lyexamination/service/api.dart';
import 'package:lyexamination/service/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(await LYExaminationApp().init());
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

  @override
  Widget build(BuildContext context) {
    final HiveService h = Get.find(tag: 'hive');

    return GetMaterialApp(
      title: '龙岩考试',
      initialRoute: h.isProfilesEmpty() ? '/create/account' : '/progress/login',
      theme: lightTheme,
      darkTheme: darkTheme,
      getPages: pages,
    );
  }
}
