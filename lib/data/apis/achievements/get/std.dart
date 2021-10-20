import 'package:lyexamination/data/apis/util.dart';

class APIAchievementsGetReq {
  final int offset;
  final int limit;

  const APIAchievementsGetReq(
      {this.offset = 0, this.limit = 9223372036854775807});
}

class APIAchievementsGetRsp {
  final int count;
  final List<APIAchievementsGetREData> examination;

  const APIAchievementsGetRsp(this.count, this.examination);

  APIAchievementsGetRsp.fromJSON(Map<String, dynamic> d)
      : this(
          d['count'],
          dynamicToTypeList<APIAchievementsGetREData>(
              d['title'], (dd) => APIAchievementsGetREData.fromJSON(dd)),
        );
}

class APIAchievementsGetREData {
  final String id;
  final String name;
  final String date;

  const APIAchievementsGetREData(this.id, this.name, this.date);

  APIAchievementsGetREData.fromJSON(Map<String, dynamic> d)
      : this(d['id'], d['name'], d['cdate']);
}
