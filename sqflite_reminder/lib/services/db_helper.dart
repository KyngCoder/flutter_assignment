import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_reminder/models/note_modal.dart';

class DatabaseHelper {
  static const String _databaseName = "Notes.db";
  static const int _version = 1;

  // For opening the database or creating if not exist
  static Future<Database> _getDB() async {
    final entry = openDatabase(
      join(await getDatabasesPath(), _databaseName),
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE Notes(id INTEGER PRIMARY KEY, noteTitle TEXT NOT NULL, noteDescription TEXT NOT NULL);",
        );
      },
      version: _version,
    );
    print(entry);
    return entry;
  }

  static Future<int> addNote(NoteModal note) async {
    final db = await _getDB();
    final noteee = await db.insert("Notes", note.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print("notee $noteee");
    return noteee;
  }

  static Future<int> remove(NoteModal note) async {
    final db = await _getDB();
    return await db.delete(
      "Notes",
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  static Future<int> updateNote(NoteModal note) async {

    final db = await _getDB();
    final result =  await db.update(
      "Notes",
      note.toJson(),
      where: 'id = ?',
      whereArgs: [note.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print("result $result");
    return result;
  }

  static Future<List<NoteModal>?> getAllNotes() async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query("Notes");

    if (maps.isEmpty) {
      return null;
    }

    return List.generate(
      maps.length,
      (index) => NoteModal.fromJson(maps[index]),
    );
  }
}
