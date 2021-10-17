import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lyexamination/boot/themes.dart';

class AppGlobeService extends GetxService {
  Rx<ThemeData> theme = _theme.obs;

  static ThemeData get _theme =>
      Get.isPlatformDarkMode ? darkTheme : lightTheme;

  ThemeData get whatThemeInPlatform => _theme;

  Future<void> changeTheme() async {
    setSystemUI();
    theme.value = whatThemeInPlatform;
  }

  Future<void> setSystemUI() async {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
        Get.isPlatformDarkMode ? uiDark : uiLight);
  }
}
