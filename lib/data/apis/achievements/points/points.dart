import 'package:lyexamination/data/apis/achievements/points/std.dart';
import 'package:lyexamination/data/apis/apis.dart';

class APIACHVsPoints extends APIs with HTTPPost {
  final APIACHVsPointsReq req;
  late final APIACHVsPointsRsp rsp;

  static const url = '/Home/Newscore/ajaxxqscore';

  APIACHVsPoints(this.req)
      : super(url, {'item_id': req.id, 'leixing': req.zone});

  @override
  void parse() {
    rsp = APIACHVsPointsRsp.fromJSON(httpRSP.data, req.zone);
  }
}
