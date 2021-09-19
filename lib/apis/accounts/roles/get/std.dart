class APIACCNTsRolesGetReq {
  final int length;

  APIACCNTsRolesGetReq({this.length = 9223372036854775807});
}

class APIACCNTsRolesGetRsp {
  final String count;
  final List<APIACCNTsRolesGetRspRData> roles;

  APIACCNTsRolesGetRsp(this.count, this.roles);

  APIACCNTsRolesGetRsp.fromJSON(Map<String, dynamic> d)
      : this(
          d['count'],
          APIACCNTsRolesGetRspRDList(d['rows']).list,
        );
}

class APIACCNTsRolesGetRspRDList {
  List<APIACCNTsRolesGetRspRData> list = [];

  APIACCNTsRolesGetRspRDList(List<dynamic> d) {
    d.forEach((dd) => list.add(APIACCNTsRolesGetRspRData.fromJSON(dd)));
  }
}

class APIACCNTsRolesGetRspRData {
  final String id;
  final String name;
  final String school;
  final String grade;
  final String c; // class
  final int nowCheck; // 不详

  APIACCNTsRolesGetRspRData(
      this.id, this.name, this.school, this.grade, this.c, this.nowCheck);

  APIACCNTsRolesGetRspRData.fromJSON(Map<String, dynamic> d)
      : this(d['unum'], d['stuname'], d['school'], d['grade'], d['class'],
            d['nowcheck']);
}
