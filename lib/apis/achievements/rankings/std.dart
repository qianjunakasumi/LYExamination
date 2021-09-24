import 'package:html/dom.dart';

class APIACHVsRankingsReq {
  final String id;

  const APIACHVsRankingsReq(this.id);
}

class APIACHVsRankingsRsp {
  final String gradeRanking;
  final String classRanking;
  final List<APIACHVsRankingsRspSubjectsRanking> subjectRankings;

  const APIACHVsRankingsRsp(
      this.gradeRanking, this.classRanking, this.subjectRankings);

  APIACHVsRankingsRsp.fromHTML(Document d)
      : this(
          d
              .querySelector(
                  'body > div > div.big > div > div.con__top.column.box-shadow > div > span:nth-child(5)')!
              .innerHtml
              .substring(5),
          d
              .querySelector(
                  'body > div > div.big > div > div.con__top.column.box-shadow > div > span:nth-child(7)')!
              .innerHtml
              .substring(5),
          (() {
            List<APIACHVsRankingsRspSubjectsRanking> t = [];
            d.querySelectorAll(
                'body > div > div.big > div > div.con-item.box-shadow.column > div.con__table > table > tbody > tr')
              ..removeAt(0) // 删除总分行
              ..forEach((dd) {
                t.add(APIACHVsRankingsRspSubjectsRanking.fromHTML(dd));
              });
            return t;
          })(),
        );
}

class APIACHVsRankingsRspSubjectsRanking {
  final String name;
  final String gradePlace;
  final String classPlace;

  const APIACHVsRankingsRspSubjectsRanking(
      this.name, this.classPlace, this.gradePlace);

  APIACHVsRankingsRspSubjectsRanking.fromHTML(Element d)
      : this(
            d.querySelector('td:nth-child(1)')!.innerHtml,
            d.querySelector('td:nth-child(7)')!.innerHtml,
            d.querySelector('td:nth-child(9)')!.innerHtml);
}
