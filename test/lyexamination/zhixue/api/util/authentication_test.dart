import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lyexamination/lyexamination/zhixue/api/util/authentication.dart';

const bicode = '0001';
const password = 'iflytek!@#123student';
const timeDifference = 0;

void main() {
  test('生成 GUID', () {
    if (kDebugMode) {
      print(const Authentication(bicode, password, timeDifference).guid());
    }
  });

  test('生成 时间戳', () {
    if (kDebugMode) {
      print(const Authentication(bicode, password, timeDifference)
          .getDateString());
    }
  });

  test('生成 Token ', () {
    if (kDebugMode) {
      print(const Authentication(bicode, password, timeDifference).make());
    }
  });
}
