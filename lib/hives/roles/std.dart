import 'package:hive_flutter/adapters.dart';

part 'std.g.dart';

@HiveType(typeId: 0)
class HiveRole {
  @HiveField(0)
  String phone;

  @HiveField(1)
  String id;

  @HiveField(2)
  String name;

  @HiveField(3)
  String school;

  @HiveField(4)
  String grade;

  @HiveField(5)
  String classNum;

  HiveRole({
    required this.id,
    required this.name,
    required this.school,
    required this.grade,
    required this.classNum,
    this.phone = '',
  });
}
