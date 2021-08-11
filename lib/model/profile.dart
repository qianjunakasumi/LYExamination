class AccountModel {
  final String phone;
  final String password;

  AccountModel(this.phone, this.password);
}

class ProfileModel {
  String number;
  String name;
  String school;
  String grade;
  String classNum;

  String phone;
  String password;

  ProfileModel(
    this.number,
    this.name,
    this.school,
    this.grade,
    this.classNum, {
    this.phone = '',
    this.password = '',
  });

  ProfileModel.fromHive(Map m)
      : number = m['number'],
        name = m['name'],
        school = m['school'],
        grade = m['grade'],
        classNum = m['class_num'],
        phone = m['phone'],
        password = m['password'];

  Map toHiveJson() {
    return {
      'number': number,
      'name': name,
      'school': school,
      'grade': grade,
      'class_num': classNum,
      'phone': phone,
      'password': password,
    };
  }
}
