import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'movie_model.dart';

class MovieScreenTask1 extends StatefulWidget {
  const MovieScreenTask1({super.key});

  @override
  State<MovieScreenTask1> createState() => _MovieScreenTask1State();
}

class _MovieScreenTask1State extends State<MovieScreenTask1> {
  List<Movie> movies = [];

  Future<void> fetchMovies() async {
    final url = Uri.parse("https://api.themoviedb.org/3/trending/movie/day?api_key=YOUR_API_KEY");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List results = data['results'];
        setState(() {
          movies = results.map((m) => Movie.fromJson(m)).toList();
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Task 1: TMDB Movies")),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(movies[index].posterUrl, width: 50, fit: BoxFit.cover),
            title: Text(movies[index].title),
          );
        },
      ),
    );
  }
}