import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lyexamination/messenger.dart';
import 'package:lyexamination/pages/achievement/achievement.dart';
import 'package:lyexamination/pages/home/home.dart';
import 'package:lyexamination/pages/progress/login.dart';
import 'package:lyexamination/pages/welcome/login/login.dart';
import 'package:lyexamination/pages/welcome/role/role.dart';

List<GetPage> get pages => [
      GetPage(
        name: '/progress/login',
        page: () => Scaffold(
          body: SafeArea(
            minimum: const EdgeInsets.only(left: 16, right: 16),
            child: ProgressLoginPage(),
          ),
        ),
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
      GetPage(
        name: '/home',
        page: () => HomeLayout(),
      ),
    ];
