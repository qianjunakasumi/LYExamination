import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const _titleColor = Color.fromRGBO(255, 255, 255, 0.85);
const _primaryColor = Color.fromRGBO(255, 255, 255, 0.65);

ThemeData get nightTheme => ThemeData.dark().copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xcc303030),
        foregroundColor: _titleColor,
        elevation: 0,
      ),
      primaryColor: const Color(0xDD36CFC9),
    );

TextTheme get nightTextTheme => ThemeData.dark().textTheme.copyWith(
      headline2: const TextStyle(
        color: _primaryColor,
        fontSize: 46,
        fontWeight: FontWeight.bold,
      ),
      headline3: const TextStyle(
        color: _primaryColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      headline4: const TextStyle(
        color: _primaryColor,
        fontSize: 24,
      ),
      headline5: const TextStyle(
        color: _primaryColor,
        fontSize: 20,
      ),
      headline6: const TextStyle(
        color: _primaryColor,
        fontSize: 14,
      ),
    );

const nightUI = SystemUiOverlayStyle(
  systemNavigationBarColor: Colors.transparent,
  systemNavigationBarDividerColor: Colors.transparent,
  systemNavigationBarIconBrightness: Brightness.light,
  statusBarColor: Colors.transparent,
  statusBarIconBrightness: Brightness.light,
);
