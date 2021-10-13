import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:dio_http2_adapter/dio_http2_adapter.dart';
import 'package:get/get.dart' as getx;
import 'package:path_provider/path_provider.dart';

class APIService extends getx.GetxService {
  late final Dio _dio;
  late final PersistCookieJar _cookie;

  Future<Dio> init() async {
    _cookie = PersistCookieJar(
      ignoreExpires: true,
      storage: FileStorage((await getTemporaryDirectory()).path + '/cookies/'),
    );

    _dio = Dio()
      ..interceptors.add(CookieManager(_cookie))
      ..httpClientAdapter = Http2Adapter(ConnectionManager(idleTimeout: 30000));

    return _dio;
  }
}
