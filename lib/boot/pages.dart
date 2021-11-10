import 'package:get/get.dart';

import '/pages/home/home.dart';
import '/pages/welcome/login/login.dart';
import '/pages/welcome/role/role.dart';

List<GetPage> get pages => [
      GetPage(
        name: '/home',
        page: () => HomeLayout(),
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
