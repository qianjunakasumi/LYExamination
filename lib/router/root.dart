import 'package:flutter/material.dart';
import 'package:lyexamination/messenger.dart';
import 'package:lyexamination/pages/create.dart';
import 'package:lyexamination/pages/home.dart';
import 'package:lyexamination/pages/privacy.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/privacy': (_) => MessengerWrapper(PrivacyPage()),
  '/home': (_) => MessengerWrapper(MyHomePage()),
  '/create/account': (_) => MessengerWrapper(CreatePage()),
};
