class APIACHVsPointsReq {
  final String id;
  final String zone;

  APIACHVsPointsReq(this.id, {this.zone = 'q'});
}

class APIACHVsPointsRsp {
  final double points;
  final double average;
  final double highest;
  final List<APIACHVsPointsRspSData> subjects;
  final int participants;

  APIACHVsPointsRsp(this.points, this.average, this.highest, this.subjects,
      this.participants);

  APIACHVsPointsRsp.fromJSON(Map<String, dynamic> d, String z)
      : this(d['my_allscore'], d['zongfenpingjunfen'], d['zuigaofen'],
            toList(d['geke'], z), d['kaoshirenshu']);

  static List<APIACHVsPointsRspSData> toList(List<dynamic> d, String z) {
    List<APIACHVsPointsRspSData> l = [];
    d.forEach((dd) => l.add(APIACHVsPointsRspSData.fromJSON(dd, z)));
    return l;
  }
}

class APIACHVsPointsRspSData {
  final String name;
  final String points;
  final String average;
  final String highest;

  APIACHVsPointsRspSData(this.name, this.points, this.average, this.highest);

  APIACHVsPointsRspSData.fromJSON(Map<String, dynamic> d, String z)
      : this(d['subject'], d['score'], d['${z}_average'], d['${z}_max']);
}
