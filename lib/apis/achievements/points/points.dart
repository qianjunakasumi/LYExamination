import 'package:lyexamination/apis/achievements/points/std.dart';
import 'package:lyexamination/apis/apis.dart';

class APIACHVsPoints extends APIs with HTTPPost {
  final APIACHVsPointsReq req;
  late final APIACHVsPointsRsp rsp;

  static const url =
      'https://mic.fjjxhl.com/Jx/index.php/Home/Newscore/ajaxxqscore';

  APIACHVsPoints(this.req)
      : super(url, {'item_id': req.id, 'leixing': req.zone});

  void parse() {
    rsp = APIACHVsPointsRsp.fromJSON(httpRSP.data, req.zone);
  }
}
