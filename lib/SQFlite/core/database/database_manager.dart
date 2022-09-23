import 'package:flutter_local_databases/SQFlite/core/model/employee_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseManager {
  Database? _database;

  final String _tableName = 'employee';
  final int _version = 1;

  final String _id = 'id';
  final String _name = 'name';
  final String _surname = 'surname';
  final String _department = 'department';
  final String _phoneNumber = 'phoneNumber';
  final String _eMail = 'eMail';
  final String _gender = 'gender';
  final String _entryYear = 'entryYear';

  Future<Database> get database async {
    final databasePath = await getDatabasesPath();
    const databaseName = 'employee.db';

    final path = join(databasePath, databaseName);

    _database = await openDatabase(
      path,
      version: _version,
      onCreate: _createDatabase,
    );

    return _database!;
  }

  // creates database table
  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name VARCHAR(30), surname VARCHAR(30),
        department VARCHAR(30),
        phoneNumber VARCHAR(11),
        eMail VARCHAR(25),
        gender INTEGER,
        entryYear TEXT)
    ''');
  }

  // getts all employee items
  Future<List<EmployeeModel>> getEmployees() async {
    final db = await database;

    List<Map<String, dynamic>> data = await db.query(
      _tableName,
      orderBy: 'id ASC', // ascending order
    );

    return List.generate(
      data.length,
      (index) => EmployeeModel(
        id: data[index]['id'],
        name: data[index]['name'],
        surname: data[index]['surname'],
        department: data[index]['department'],
        phoneNumber: data[index]['phoneNumber'],
        eMail: data[index]['eMail'],
        gender: data[index]['gender'] == 1 ? true : false,
        entryYear: DateTime.parse(data[index]['entryYear']),
      ),
    );
  }

  Future<void> insert(EmployeeModel employee) async {
    final db = await database;

    db.insert(
      _tableName,
      employee.toMap(),
      // if employee model is same it will replace with old employee model
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
