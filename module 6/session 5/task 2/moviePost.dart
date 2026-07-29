import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviePostScreen extends StatefulWidget {
  const MoviePostScreen({super.key});

  @override
  State<MoviePostScreen> createState() => _MoviePostScreenState();
}

class _MoviePostScreenState extends State<MoviePostScreen> {
  final _movieNameController = TextEditingController();
  final _ratingController = TextEditingController();

  Future<void> _postMovie() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.post(
      url,
      body: jsonEncode({
        'title': _movieNameController.text,
        'rating': _ratingController.text,
      }),
      headers: {'Content-type': 'application/json; charset=UTF-8'},
    );

    if (mounted) {
      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Success')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Failed')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task 2: Movie POST')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _movieNameController,
              decoration: const InputDecoration(labelText: 'Movie Name'),
            ),
            TextField(
              controller: _ratingController,
              decoration: const InputDecoration(labelText: 'Rating'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _postMovie,
              child: const Text('Post Movie'),
            ),
          ],
        ),
      ),
    );
  }
}
