import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:root_check/root_check.dart';

const String _msg = '您的设备不受支持';

void rootCheck() async {
  if (await RootCheck.isRooted == true) {
    Fluttertoast.showToast(msg: _msg);
    exit(0);
  }
}
