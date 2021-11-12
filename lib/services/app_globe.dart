import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '/boot/theme_light.dart';
import '/boot/theme_night.dart';

class AppGlobeService extends GetxService {
  final Rx<ThemeData> theme = platformTheme.obs;
  final Rx<TextTheme> textTheme = platformTextTheme.obs;

  static ThemeData get platformTheme =>
      Get.isPlatformDarkMode ? nightTheme : lightTheme;

  static TextTheme get platformTextTheme =>
      Get.isPlatformDarkMode ? nightTextTheme : lightTextTheme;

  Future<void> setSystemUI() async {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
        Get.isPlatformDarkMode ? nightUI : lightUI);
  }

  Future<void> changeTheme() async {
    setSystemUI();
    theme(platformTheme);
    textTheme(platformTextTheme);
  }
}
