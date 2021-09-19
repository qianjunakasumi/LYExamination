class APIAccountsLoginReq {
  final String phone;
  final String password;

  APIAccountsLoginReq(this.phone, this.password);
}

class APIAccountsLoginRsp {
  final String message;

  APIAccountsLoginRsp(this.message);

  APIAccountsLoginRsp.fromJSON(Map<String, dynamic> d) : this(d['msg']);
}
