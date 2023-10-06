import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseHelper {
  static Database? database;

  Future<Database> get db async {
    if (db != null) {
      return db;
    } else {
      final db = await initDatabase();
      return db;
    }
  }

  Future<Database> initDatabase() async {
    final userDirectory = await getDatabasesPath();

    final userNotePath = join(userDirectory, "notes.text");

    final db = await openDatabase(userNotePath, version: 1, onCreate: onCreate);
    return db;
  }

  Future<void> onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE notes("
        "id INTEGER PRIMARY KEY NOT NULL AUTOINCREMENT,"
        "title TEXT NOT NULL,"
        "description TEXT NOT NULL"
        ")");
  }
}
