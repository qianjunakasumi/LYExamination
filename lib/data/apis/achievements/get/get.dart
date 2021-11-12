import '/data/apis/achievements/get/std.dart';
import '/data/apis/apis.dart';

class APIAchievementsGet extends APIs with HTTPGet {
  final APIAchievementsGetReq req;
  late final APIAchievementsGetRsp rsp;

  static const url = '/Home/Achievement/ajax_showmark_upCallback';

  APIAchievementsGet(this.req)
      : super(url, {'num': req.offset, 'size': req.limit});

  @override
  void parse() {
    rsp = APIAchievementsGetRsp.fromJSON(httpRSP.data);
  }
}
