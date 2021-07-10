import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

final http = Dio();
final _cookieJar = CookieJar();

void init() async {
  http.interceptors.add(CookieManager(_cookieJar));
}
