import 'package:get/get.dart';
import 'package:lyexamination/apis/achievements/points/points.dart';
import 'package:lyexamination/apis/achievements/points/std.dart';
import 'package:lyexamination/apis/achievements/rankings/rankings.dart';
import 'package:lyexamination/apis/achievements/rankings/std.dart';
import 'package:lyexamination/apis/exception/api.dart';
import 'package:lyexamination/pages/achievement/std.dart';

class ACHVPController extends GetxController {
  final String id;
  final String name;
  final String date;

  var points = ' --- '.obs;
  var averagePoints = ' --- '.obs;
  var mostPoints = ' --- '.obs;
  var subjectsPoints = <String, Rx<ACHVPSubjectCardData>>{}.obs;

  void updatePoints() async {
    final a = APIACHVsPoints(APIACHVsPointsReq(id));
    try {
      await a.wait();
    } on APIException {
      rethrow;
    }

    final rsp = a.rsp;
    points(rsp.points);
    averagePoints(rsp.average);
    mostPoints(rsp.highest);
    rsp.subjects.forEach((e) {
      if (subjectsPoints[e.name] == null)
        subjectsPoints[e.name] = ACHVPSubjectCardData.futurePoints(e).obs;
      else
        subjectsPoints[e.name]!.update((d) => d!.updatePoints(e));
    });
  }

  void updateRankings() async {
    final a = APIACHVsRankings(APIACHVsRankingsReq(id));
    try {
      await a.wait();
    } on APIException {
      rethrow;
    }

    a.rsp.subjectRankings.forEach((e) {
      if (subjectsPoints[e.name] == null)
        subjectsPoints[e.name] = ACHVPSubjectCardData.futureRankings(e).obs;
      else
        subjectsPoints[e.name]!.update((d) => d!.updateRankings(e));
    });
  }

  void loadAchievement() async {
    updatePoints();
    updateRankings();
  }

  ACHVPController(this.id, this.name, this.date);
}
