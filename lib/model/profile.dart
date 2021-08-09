class AccountModel {
  final String phone;
  final String password;

  AccountModel(this.phone, this.password);
}

class ProfileModel {
  final String number;
  final String name;
  final String school;
  final String grade;
  final String classNum;

  final String phone;
  final String password;

  ProfileModel(
    this.number,
    this.name,
    this.school,
    this.grade,
    this.classNum, {
    this.phone = '',
    this.password = '',
  });
}
