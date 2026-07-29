import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dbhelper.dart';
import 'model2.dart';

class Task3Screen extends StatefulWidget {
  const Task3Screen({super.key});

  @override
  State<Task3Screen> createState() => _Task3ScreenState();
}

class _Task3ScreenState extends State<Task3Screen> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  late Future<List<Song>> _futureSongs;

  Future<List<Song>> fetchTopSongs() async {
    try {
      final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos?_limit=15"));
      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        List<Song> songs = data.map((json) => Song.fromJson(json)).toList();
        await _dbHelper.saveSongs(songs);
        return songs;
      }
    } catch (e) {
      return await _dbHelper.getSongs();
    }
    return await _dbHelper.getSongs();
  }

  @override
  void initState() {
    super.initState();
    _futureSongs = fetchTopSongs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Task 3: SQLite Cache")),
      body: FutureBuilder<List<Song>>(
        future: _futureSongs,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
          final songs = snapshot.data ?? [];
          return ListView.builder(
            itemCount: songs.length,
            itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(child: Text("${index + 1}")),
              title: Text(songs[index].title),
            ),
          );
        },
      ),
    );
  }
}