import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeInitialPage extends StatelessWidget {
  const WelcomeInitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(),
          Text(
            '欢\n迎',
            style: Get.textTheme.headline2,
            textScaleFactor: 1.64,
          ),
        ],
      ),
    );
  }
}
