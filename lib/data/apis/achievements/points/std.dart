import '/data/apis/util.dart';

class APIACHVsPointsReq {
  final String id;
  final String zone;

  const APIACHVsPointsReq(this.id, {this.zone = 'q'});
}

class APIACHVsPointsRsp {
  final String points;
  final String average;
  final String highest;
  final List<APIACHVsPointsRSData> subjects;
  final int participants;

  const APIACHVsPointsRsp(this.points, this.average, this.highest,
      this.subjects, this.participants);

  APIACHVsPointsRsp.fromJSON(Map<String, dynamic> d, String z)
      : this(
          d['my_allscore'].toString(),
          d['zongfenpingjunfen'].toString(),
          d['zuigaofen'].toString(),
          dynamicToTypeList<APIACHVsPointsRSData>(
              d['geke'], (dd) => APIACHVsPointsRSData.fromJSON(dd, z)),
          d['kaoshirenshu'],
        );
}

class APIACHVsPointsRSData {
  final String name;
  final String points;
  final String average;
  final String highest;

  const APIACHVsPointsRSData(
      this.name, this.points, this.average, this.highest);

  APIACHVsPointsRSData.fromJSON(Map<String, dynamic> d, String z)
      : this(d['subject'], d['score'], d['${z}_average'], d['${z}_max']);
}
