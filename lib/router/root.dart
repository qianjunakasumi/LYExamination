import 'package:flutter/material.dart';
import 'package:lyexamination/layout.dart';
import 'package:lyexamination/pages/create.dart';
import 'package:lyexamination/pages/home.dart';
import 'package:lyexamination/pages/privacy.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/privacy': (context) => Wrapper(PrivacyPage()),
  '/home': (context) => Wrapper(MyHomePage()),
  '/create': (context) => Wrapper(CreatePage()),
};
