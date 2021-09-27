import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lyexamination/messenger.dart';
import 'package:lyexamination/pages/achievement/achievement.dart';
import 'package:lyexamination/pages/create/account/account.dart';
import 'package:lyexamination/pages/create/privacy.dart';
import 'package:lyexamination/pages/create/profile/profile.dart';
import 'package:lyexamination/pages/exam/list/list.dart';
import 'package:lyexamination/pages/progress/login.dart';
import 'package:lyexamination/service/api.dart';
import 'package:lyexamination/service/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(await LYExaminationApp().init());
}

class LYExaminationApp extends StatelessWidget {
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
      initialRoute: h.isProfilesEmpty() ? '/create/privacy' : '/progress/login',
      theme: lightTheme,
      darkTheme: darkTheme,
      getPages: pages,
    );
  }

  List<GetPage> get pages => [
        GetPage(
          name: '/progress/login',
          page: () => MessengerWrapper(ProgressLoginPage()),
        ),
        GetPage(
          name: '/achievement',
          page: () => MessengerWrapper(AchievementPage()),
        ),
        GetPage(
          name: '/exam/list',
          page: () => MessengerWrapper(ExamListPage()),
        ),
        GetPage(
          name: '/create/privacy',
          page: () => MessengerWrapper(CreatePrivacyPage()),
        ),
        GetPage(
          name: '/create/account',
          page: () => MessengerWrapper(CreateAccountPage()),
        ),
        GetPage(
          name: '/create/profile',
          page: () => MessengerWrapper(CreateProfilePage()),
        ),
      ];

  ThemeData get lightTheme => ThemeData(
        primaryColor: Color(0xFF36CFC9),
        scaffoldBackgroundColor: Colors.white.withOpacity(0.96),
        textTheme: TextTheme(
          headline2: TextStyle(
            color: titleColorLight,
            fontSize: 46,
            fontWeight: FontWeight.bold,
          ),
          headline3: TextStyle(
            color: titleColorLight,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          headline4: TextStyle(
            color: primaryColorLight,
            fontSize: 24,
          ),
          headline5: TextStyle(
            color: primaryColorLight,
            fontSize: 20,
          ),
          headline6: TextStyle(
            color: primaryColorLight,
            fontSize: 14,
          ),
        ),
      );

  ThemeData get darkTheme => ThemeData(
        primaryColor: Color(0xDD36CFC9),
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          headline2: TextStyle(
            color: titleColorDark,
            fontSize: 46,
            fontWeight: FontWeight.bold,
          ),
          headline3: TextStyle(
            color: titleColorDark,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          headline4: TextStyle(
            color: primaryColorDark,
            fontSize: 24,
          ),
          headline5: TextStyle(
            color: primaryColorDark,
            fontSize: 20,
          ),
          headline6: TextStyle(
            color: primaryColorDark,
            fontSize: 14,
          ),
        ),
      );

  static const titleColorLight = Color.fromRGBO(0, 0, 0, 0.85);
  static const titleColorDark = Color.fromRGBO(255, 255, 255, 0.85);
  static const primaryColorLight = Color.fromRGBO(0, 0, 0, 0.65);
  static const primaryColorDark = Color.fromRGBO(255, 255, 255, 0.65);
}
