import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../task 4/model4.dart';
import 'dbhelper2.dart';

class Task4Screen extends StatefulWidget {
  const Task4Screen({super.key});

  @override
  State<Task4Screen> createState() => _Task4ScreenState();
}

class _Task4ScreenState extends State<Task4Screen> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  bool _isOffline = false;
  List<Song> _songs = [];
  bool _isLoading = true;

  Future<void> fetchSongs() async {
    setState(() => _isLoading = true);
    try {
      final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos?_limit=15")).timeout(const Duration(seconds: 3));
      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        _songs = data.map((json) => Song.fromJson(json)).toList();
        await _dbHelper.saveSongs(_songs);
        setState(() {
          _isOffline = false;
          _isLoading = false;
        });
        return;
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
      appBar: AppBar(title: const Text("Task 4: Offline Banner")),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [
          if (_isOffline)
            Container(
              color: Colors.orange,
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              child: const Text("Offline - Showing Cached Data", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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