import 'package:get/get.dart';
import 'package:lyexamination/messenger.dart';
import 'package:lyexamination/pages/achievement/achievement.dart';
import 'package:lyexamination/pages/create/profile/profile.dart';
import 'package:lyexamination/pages/exam/list/list.dart';
import 'package:lyexamination/pages/progress/login.dart';
import 'package:lyexamination/pages/welcome/login/login.dart';

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
        name: '/welcome/login',
        page: () => WelcomeLoginPage(),
      ),
      GetPage(
        name: '/create/profile',
        page: () => MessengerWrapper(CreateProfilePage()),
      ),
    ];