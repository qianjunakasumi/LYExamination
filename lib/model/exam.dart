class ExamInfoModel {
  String id;
  String name;
  DateTime date;

  ExamInfoModel(this.id, this.name, this.date);

  ExamInfoModel.fromHive(Map m)
      : id = m['id'],
        name = m['name'],
        date = m['date'];

  Map toHiveJson() {
    return {
      'id': id,
      'name': name,
      'date': date,
    };
  }
}
