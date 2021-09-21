class APIAchievementsGetReq {
  final int offset;
  final int limit;

  APIAchievementsGetReq({this.offset = 0, this.limit = 9223372036854775807});
}

class APIAchievementsGetRsp {
  final int count;
  final List<APIAchievementsGetRspEData> examination;

  APIAchievementsGetRsp(this.count, this.examination);

  APIAchievementsGetRsp.fromJSON(Map<String, dynamic> d)
      : this(d['count'], APIAchievementsGetRspEDList(d['title']).list);
}

class APIAchievementsGetRspEDList {
  List<APIAchievementsGetRspEData> list = [];

  APIAchievementsGetRspEDList(List<dynamic> d) {
    d.forEach((dd) => list.add(APIAchievementsGetRspEData.fromJSON(dd)));
  }
}

class APIAchievementsGetRspEData {
  final String id;
  final String name;
  final String date;

  APIAchievementsGetRspEData(this.id, this.name, this.date);

  APIAchievementsGetRspEData.fromJSON(Map<String, dynamic> d)
      : this(d['id'], d['name'], d['cdate']);
}
