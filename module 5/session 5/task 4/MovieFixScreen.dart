import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class MovieDbHelper {
  static final _databaseName = "movies_fix.db";
  static final table = 'movies';
  static final columnId = 'id';
  static final columnTitle = 'title';

  static Database? _database;
  MovieDbHelper._privateConstructor();
  static final MovieDbHelper instance = MovieDbHelper._privateConstructor();

  Future<Database> get database async => _database ??= await _initDatabase();

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path, version: 1, onCreate: (db, v) async {
      await db.execute('CREATE TABLE $table ($columnId INTEGER PRIMARY KEY, $columnTitle TEXT)');
    });
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await instance.database;
    return await db.query(table);
  }
}

class MovieFixScreen extends StatefulWidget {
  const MovieFixScreen({super.key});

  @override
  State<MovieFixScreen> createState() => _MovieFixScreenState();
}

class _MovieFixScreenState extends State<MovieFixScreen> {
  final TextEditingController movieController = TextEditingController();
  List<Map<String, dynamic>> _movieList = [];

  @override
  void initState() {
    super.initState();
    _refreshMovies();
  }

  Future<void> _refreshMovies() async {
    final data = await MovieDbHelper.instance.queryAll();
    setState(() {
      _movieList = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text("Movie List Manager", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: movieController,
                        decoration: const InputDecoration(
                          hintText: "Enter movie title...",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_circle, color: Colors.redAccent, size: 30),
                      onPressed: () async {
                        if (movieController.text.trim().isNotEmpty) {
                          await MovieDbHelper.instance.insert({'title': movieController.text.trim()});
                          await _refreshMovies();
                          movieController.clear();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _movieList.isEmpty
                  ? const Center(
                      child: Text("No movies added yet.", style: TextStyle(color: Colors.grey)),
                    )
                  : ListView.builder(
                      itemCount: _movieList.length,
                      itemBuilder: (context, index) => Card(
                        margin: const EdgeInsets.only(bottom: 10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          leading: const Icon(Icons.movie, color: Colors.redAccent),
                          title: Text(
                            _movieList[index]['title'],
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                          trailing: const Icon(Icons.chevron_right),
                        ),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
