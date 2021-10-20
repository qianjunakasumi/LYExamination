class APIAccountsLoginReq {
  final String phone;
  final String password;

  const APIAccountsLoginReq(this.phone, this.password);
}

class APIAccountsLoginRsp {
  final int status;
  final String message;

  const APIAccountsLoginRsp(this.status, this.message);

  APIAccountsLoginRsp.fromJSON(Map<String, dynamic> d)
      : this(d['code'], d['msg']);
}
