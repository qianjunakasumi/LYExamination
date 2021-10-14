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

    _dio = Dio(BaseOptions(
      baseUrl:
          '\x68\x74\x74\x70\x73\x3A\x2F\x2F\x6D\x69\x63\x2E\x66\x6A\x6A\x78\x68\x6C\x2E\x63\x6F\x6D\x2F\x4A\x78\x2F\x69\x6E\x64\x65\x78\x2E\x70\x68\x70',
      headers: {
        'user-agent':
            'Mozilla/5.0 (Linux; Android 12; 千早振る; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/78.0.3904.62 XWEB/2899 MMWEBSDK/20210601 Mobile Safari/537.36 MMWEBID/7628 MicroMessenger/8.0.9.1940(0x28000951) Process/toolsmp WeChat/arm128 Weixin NetType/6G Language/ja_JP ABI/arm128'
      },
    ))
      ..interceptors.add(CookieManager(_cookie))
      ..httpClientAdapter = Http2Adapter(ConnectionManager(idleTimeout: 30000));

    return _dio;
  }
}
