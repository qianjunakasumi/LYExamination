import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:get/get.dart' as Get;
import 'package:path_provider/path_provider.dart';

class APIService extends Get.GetxService {
  late final _dio;
  late final _cookie;

  Future<Dio> init() async {
    _cookie = PersistCookieJar(
      ignoreExpires: true,
      storage: FileStorage((await getTemporaryDirectory()).path + '/cookies/'),
    );

    _dio = Dio()
      ..interceptors.add(CookieManager(_cookie))

    return _dio;
  }
}
