import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lyexamination/boot/themes.dart';

ThemeData get platformTheme => Get.isPlatformDarkMode ? darkTheme : lightTheme;

class AppGlobeService extends GetxService {
  Rx<ThemeData> theme = platformTheme.obs;

  Future<void> setSystemUI() async {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
        Get.isPlatformDarkMode ? uiDark : uiLight);
  }

  Future<void> changeTheme() async {
    setSystemUI();
    theme.value = platformTheme;
  }
}
