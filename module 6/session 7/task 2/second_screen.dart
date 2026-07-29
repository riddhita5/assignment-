import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

class Task2Screen extends StatefulWidget {
  const Task2Screen({super.key});

  @override
  State<Task2Screen> createState() => _Task2ScreenState();
}

class _Task2ScreenState extends State<Task2Screen> {
  static List<Song>? _cachedSongs;
  static DateTime? _cacheTime;
  late Future<List<Song>> _futureSongs;

  Future<List<Song>> fetchTopSongs() async {
    if (_cachedSongs != null && _cacheTime != null) {
      if (DateTime.now().difference(_cacheTime!).inMinutes < 1) {
        print("Using In-Memory Cache");
        return _cachedSongs!;
      }
    }

    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos?_limit=15"));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      _cachedSongs = data.map((json) => Song.fromJson(json)).toList();
      _cacheTime = DateTime.now();
      return _cachedSongs!;
    } else {
      throw Exception("Failed to fetch songs");
    }
  }

  @override
  void initState() {
    super.initState();
    _futureSongs = fetchTopSongs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Task 2: Memory Cache")),
      body: FutureBuilder<List<Song>>(
        future: _futureSongs,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) return Center(child: Text("Error: ${snapshot.error}"));

          final songs = snapshot.data!;
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