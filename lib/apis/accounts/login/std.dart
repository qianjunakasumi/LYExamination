class APIAccountsLoginReq {
  final String phone;
  final String password;

  const APIAccountsLoginReq(this.phone, this.password);
}

class APIAccountsLoginRsp {
  final String message;

  const APIAccountsLoginRsp(this.message);

  APIAccountsLoginRsp.fromJSON(Map<String, dynamic> d) : this(d['msg']);
}
