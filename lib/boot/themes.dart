import 'package:flutter/material.dart';

ThemeData get lightTheme => ThemeData(
      primaryColor: Color(0xFF36CFC9),
      scaffoldBackgroundColor: Colors.white.withOpacity(0.96),
      textTheme: TextTheme(
        headline2: headline2(false),
        headline3: headline3(false),
        headline4: headline4(false),
        headline5: headline5(false),
        headline6: headline6(false),
      ),
    );

ThemeData get darkTheme => ThemeData(
      primaryColor: Color(0xDD36CFC9),
      scaffoldBackgroundColor: Colors.white.withOpacity(0.08),
      textTheme: TextTheme(
        headline2: headline2(true),
        headline3: headline3(true),
        headline4: headline4(true),
        headline5: headline5(true),
        headline6: headline6(true),
      ),
    );

headline2(bool d) => TextStyle(
      color: d ? primaryColorDark : primaryColorLight,
      fontSize: 46,
      fontWeight: FontWeight.bold,
    );

headline3(bool d) => TextStyle(
      color: d ? primaryColorDark : primaryColorLight,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );

headline4(bool d) => TextStyle(
      color: d ? primaryColorDark : primaryColorLight,
      fontSize: 24,
    );

headline5(bool d) => TextStyle(
      color: d ? primaryColorDark : primaryColorLight,
      fontSize: 20,
    );

headline6(bool d) => TextStyle(
      color: d ? primaryColorDark : primaryColorLight,
      fontSize: 14,
    );

const titleColorLight = Color.fromRGBO(0, 0, 0, 0.85);
const titleColorDark = Color.fromRGBO(255, 255, 255, 0.85);
const primaryColorLight = Color.fromRGBO(0, 0, 0, 0.65);
const primaryColorDark = Color.fromRGBO(255, 255, 255, 0.65);
