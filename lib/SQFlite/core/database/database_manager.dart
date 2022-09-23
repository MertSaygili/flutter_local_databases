import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseManager {
  Database? _database;

  final String _userTableName = 'employee';
  final int _version = 1;

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
    await db.execute('''''');
  }
}
