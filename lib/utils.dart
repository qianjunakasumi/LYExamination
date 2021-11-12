import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

List<T> list2List<S, T>(List<S> s, T Function(S) f) {
  List<T> t = [];
  for (S e in s) {
    t.add(f(e));
  }
  return t;
}

void snack(String content, {bool feedback = false}) {
  late SnackBar b;
  if (feedback) {
    b = SnackBar(
      content: Text(content),
      action: SnackBarAction(
        label: '发送反馈',
        onPressed: () => launch(
          'mqqopensdkapi://bizAgent/qm/qr?url=http%3A%2F%2Fqm.qq.com%2Fcgi-bin%2Fqm%2Fqr%3Ffrom%3Dapp%26p%3Dandroid%26jump_from%3Dwebapi%26k%3DWXvwr8_hrPRtDQv7lCiRKoi63lK0tbGe',
        ),
      ),
    );
  } else {
    b = SnackBar(content: Text(content));
  }
  ScaffoldMessenger.of(Get.context!).showSnackBar(b);
}

void process() {
  Get.dialog(
    const Center(
      child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
    ),
    barrierDismissible: false,
  );
}

void complete() {
  Get.back();
}
