import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'song_model.dart';

class Task1Screen extends StatefulWidget {
  const Task1Screen({super.key});

  @override
  State<Task1Screen> createState() => _Task1ScreenState();
}

class _Task1ScreenState extends State<Task1Screen> {
  late Future<List<Song>> _futureSongs;

  Future<List<Song>> fetchTopSongs() async {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos?_limit=15"));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((json) => Song.fromJson(json)).toList();
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
      appBar: AppBar(title: const Text("Task 1: Basic Fetch")),
      body: FutureBuilder<List<Song>>(
        future: _futureSongs,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
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