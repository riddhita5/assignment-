import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../task 5/model9.dart';
import 'dbhelper5.dart';

class Task5Screen extends StatefulWidget {
  const Task5Screen({super.key});

  @override
  State<Task5Screen> createState() => _Task5ScreenState();
}

class _Task5ScreenState extends State<Task5Screen> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  bool _isOffline = false;
  bool _isLoading = false;
  List<Song> _songs = [];

  Future<void> fetchSongs() async {
    setState(() => _isLoading = true);
    try {
      final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos?_limit=15")).timeout(const Duration(seconds: 5));
      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        _songs = data.map((json) => Song.fromJson(json)).toList();
        await _dbHelper.saveSongs(_songs);
        setState(() {
          _isOffline = false;
          _isLoading = false;
        });
      }
    } catch (e) {
      final cached = await _dbHelper.getSongs();
      setState(() {
        _songs = cached;
        _isOffline = true;
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchSongs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task 5: Refresh Button"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: fetchSongs, // Task 5: Refresh button forces a new fetch
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [
          if (_isOffline)
            Container(
              color: Colors.redAccent,
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              child: const Text("Offline - Showing Cached Data", textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: _songs.length,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(child: Text("${index + 1}")),
                title: Text(_songs[index].title),
              ),
            ),
          ),
        ],
      ),
    );
  }
}