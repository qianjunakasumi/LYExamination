import 'package:lyexamination/boot//data/sqflite.dart';
import 'package:lyexamination/model/database/table/student.dart';

Future<List<Student>> retrieveStudents() async {
  final db = await appDatabase;
  final List<Map<String, dynamic>> maps = await db.query('student');

  return List.generate(maps.length, (i) {
    return Student(
      id: maps[i]['id'],
      name: maps[i]['name'],
    );
  });
}
