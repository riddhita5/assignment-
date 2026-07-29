import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'model2.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await openDatabase(
      join(await getDatabasesPath(), 'songs_task3.db'),
      onCreate: (db, version) => db.execute("CREATE TABLE songs(id INTEGER PRIMARY KEY, title TEXT)"),
      version: 1,
    );
    return _database!;
  }

  Future<void> saveSongs(List<Song> songs) async {
    final db = await database;
    await db.delete('songs');
    for (var song in songs) {
      await db.insert('songs', song.toMap());
    }
  }

  Future<List<Song>> getSongs() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('songs');
    return maps.map((m) => Song.fromMap(m)).toList();
  }
}
