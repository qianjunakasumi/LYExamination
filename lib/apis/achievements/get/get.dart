import 'package:lyexamination/apis/achievements/get/std.dart';
import 'package:lyexamination/apis/apis.dart';

class APIAchievementsGet extends APIs with HTTPGet {
  final APIAchievementsGetReq req;
  late final APIAchievementsGetRsp rsp;

  static const url =
      'https://mic.fjjxhl.com/Jx/index.php/Home/Achievement/ajax_showmark_upCallback';

  APIAchievementsGet(this.req)
      : super(url, {'num': req.offset, 'size': req.limit});

  void parse() {
    rsp = APIAchievementsGetRsp.fromJSON(httpRSP.data);
  }
}
