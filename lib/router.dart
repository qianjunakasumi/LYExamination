import 'package:get/get.dart';
import 'package:lyexamination/messenger.dart';
import 'package:lyexamination/pages/create/account/account.dart';
import 'package:lyexamination/pages/create/profile/profile.dart';
import 'package:lyexamination/pages/home.dart';
import 'package:lyexamination/pages/privacy.dart';

List<GetPage> routes = [
  GetPage(
    name: '/home',
    page: () => MessengerWrapper(MyHomePage()),
  ),
  GetPage(
    name: '/privacy',
    page: () => MessengerWrapper(PrivacyPage()),
  ),
  GetPage(
    name: '/create/account',
    page: () => MessengerWrapper(CreateAccountPage()),
  ),
  GetPage(
    name: '/create/profile',
    page: () => MessengerWrapper(CreateProfilePage()),
  ),
];
