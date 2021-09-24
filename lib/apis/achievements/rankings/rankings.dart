import 'package:html/parser.dart' as HTML show parse;
import 'package:lyexamination/apis/achievements/rankings/std.dart';
import 'package:lyexamination/apis/apis.dart';

class APIACHVsRankings extends APIs with HTTPGet {
  final APIACHVsRankingsReq req;
  late final APIACHVsRankingsRsp rsp;

  APIACHVsRankings(this.req)
      : super(
            'https://mic.fjjxhl.com/42baobaobanpai/index.php/Admin/Zzy/zhenduan/item_id/' +
                req.id,
            {});

  void parse() {
    rsp = APIACHVsRankingsRsp.fromHTML(HTML.parse(httpRSP.data));
  }
}
