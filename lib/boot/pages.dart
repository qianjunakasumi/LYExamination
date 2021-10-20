import 'package:get/get.dart';
import 'package:lyexamination/messenger.dart';
import 'package:lyexamination/pages/achievement/achievement.dart';
import 'package:lyexamination/pages/progress/login.dart';
import 'package:lyexamination/pages/welcome/login/login.dart';
import 'package:lyexamination/pages/welcome/role/role.dart';

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
        name: '/welcome/login',
        page: () => WelcomeLoginPage(),
      ),
      GetPage(
        name: '/welcome/role',
        page: () => WelcomeRolePage(),
      ),
    ];
