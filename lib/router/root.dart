import 'package:get/get.dart';
import 'package:lyexamination/messenger.dart';
import 'package:lyexamination/pages/create.dart';
import 'package:lyexamination/pages/home.dart';
import 'package:lyexamination/pages/privacy.dart';

List<GetPage> routes = [
  GetPage(name: '/privacy', page: () => MessengerWrapper(PrivacyPage())),
  GetPage(name: '/home', page: () => MessengerWrapper(MyHomePage())),
  GetPage(name: '/create/account', page: () => MessengerWrapper(CreatePage())),
];
