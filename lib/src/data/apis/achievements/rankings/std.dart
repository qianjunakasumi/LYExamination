//  Copyright (c) 2022 qianjunakasumi <i@qianjunakasumi.ren>
//                     qianjunakasumi <qianjunakasumi@outlook.com>
//                     [qianjunakasumi] 千橘雫霞(https://github.com/qianjunakasumi)
//
//       This Source Code Form is subject to the terms of the Mozilla Public
//       License, v. 2.0. If a copy of the MPL was not distributed with this
//       file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:html/dom.dart';

import '/src/atoms/utils/list2list.dart';

class APIACHVsRankingsReq {
  final String id;

  const APIACHVsRankingsReq(this.id);
}

class APIACHVsRankingsRsp {
  final String gradeRanking;
  final String classRanking;
  final List<APIACHVsRankingsRSRData> subjectRankings;

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
          list2List<Element, APIACHVsRankingsRSRData>(
              d.querySelectorAll(
                  'body > div > div.big > div > div.con-item.box-shadow.column > div.con__table > table > tbody > tr')
                ..removeAt(0), // 删除总分行
              (dd) => APIACHVsRankingsRSRData.fromHTML(dd)),
        );
}

class APIACHVsRankingsRSRData {
  final String name;
  final String gradePlace;
  final String classPlace;

  const APIACHVsRankingsRSRData(this.name, this.classPlace, this.gradePlace);

  APIACHVsRankingsRSRData.fromHTML(Element d)
      : this(
            d.querySelector('td:nth-child(1)')!.innerHtml,
            d.querySelector('td:nth-child(7)')!.innerHtml,
            d.querySelector('td:nth-child(9)')!.innerHtml);
}
