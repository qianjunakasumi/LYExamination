import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Messenger {
  static void snackBar(String content, {bool feedback}) {
    SnackBar b = SnackBar(content: Text(content));

    if (feedback == true) {
      b = SnackBar(
        content: Text(content),
        action: SnackBarAction(
          label: '发送反馈',
          onPressed: () => launch(
            'mqqopensdkapi://bizAgent/qm/qr?url=http%3A%2F%2Fqm.qq.com%2Fcgi-bin%2Fqm%2Fqr%3Ffrom%3Dapp%26p%3Dandroid%26jump_from%3Dwebapi%26k%3DLbJQs4vVwxTSKRCK2TfzOyl8X9Op_jNk',
          ),
        ),
      );
    }

    ScaffoldMessenger.of(Get.context).showSnackBar(b);
  }

  static void process() {
    showDialog(
      context: Get.context,
      builder: (_) => Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static void completeProcess() {
    Navigator.pop(Get.context);
  }
}

class MessengerWrapper extends StatelessWidget {
  final Widget _child;

  MessengerWrapper(this._child);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 24, right: 24),
          child: _child,
        ),
      ),
    );
  }
}
