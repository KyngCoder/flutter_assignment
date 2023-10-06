import 'package:path/path.dart';
import 'package:sqf_lite_yt/notes_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler {
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await _initDatabase();
    return _db!;
  }

  Future<Database> _initDatabase() async {
    final path = await getDatabasesPath();

    final dbPath = join(path, "notes.db");

    final db = await openDatabase(dbPath, version: 1, onCreate: _onCreate);

    return db;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE notes("
        "id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "title TEXT NOT NULL, "
        "description TEXT NOT NULL"
        ")");
  }

  Future<NotesModel> insert(NotesModel note) async {
    final dbClient = await db;
    await dbClient.insert("notes", note.toMap());
    return note;
  }

  Future<List<NotesModel>> getNotesList() async {
    final dbClient = await db;
    final List<Map<String, dynamic>> queryResults =
        await dbClient.query("notes");

    List<NotesModel> notesList =
        queryResults.map((note) => NotesModel.fromMap(note)).toList();

    return notesList.reversed.toList();
  }

  Future<int> delete(int id) async {
    final dbClient = await db;
    return await dbClient.delete(
      "notes",
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<int> update(NotesModel note) async {
    final dbClient = await db;

    return await dbClient.update(
      "notes",
      note.toMap(),
      where: "id = ?",
      whereArgs: [note.id],
    );
  }
}
