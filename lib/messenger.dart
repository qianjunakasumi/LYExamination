import 'package:flutter/material.dart';
import 'package:lyexamination/service/profile.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

BuildContext _instance;

class MessengerWrapper extends StatelessWidget {
  MessengerWrapper(this._child);

  final Widget _child;

  @override
  Widget build(BuildContext context) {
    _instance = context;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 24, right: 24),
          child: MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => ProfileService()),
            ],
            child: _child,
          ),
        ),
      ),
    );
  }
}

class Messenger {
  void snackBar(String content, {bool feedback}) {
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

    ScaffoldMessenger.of(_instance).showSnackBar(b);
  }

  void process() {
    showDialog(
      context: _instance,
      builder: (_) => Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
      barrierDismissible: false,
    );
  }

  void completeProcess() {
    Navigator.pop(_instance);
  }
}
