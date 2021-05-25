import 'package:sqflite/sqflite.dart';

const String _name = 'lyexamination';
const String _createTable =
    'CREATE TABLE IF NOT EXISTS students (id INTEGER PRIMARY KEY, name TEXT)';

final Future<Database> appDatabase = openDatabase(
  _name,
  onCreate: (db, v) {
    return db.execute(_createTable);
  },
  version: 1,
);
