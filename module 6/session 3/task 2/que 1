import 'package:flutter/material.dart';

class Data extends StatelessWidget {
  const Data({super.key});

  @override
  Widget build(BuildContext context) {

    Map<String, dynamic> movieJson = {
      "title": "Inception",
      "year": 2010,
      "genre": "Sci-Fi"
    };

    Movie movie = Movie.fromJson(movieJson);

    print("Title: ${movie.title}");
    print("Year: ${movie.year}");
    print("Genre: ${movie.genre}");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie"),
      ),
      body: const Center(
        child: Text("Check Debug Console"),
      ),
    );
  }
}

class Movie {
  String title;
  int year;
  String genre;

  Movie({
    required this.title,
    required this.year,
    required this.genre,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json["title"],
      year: json["year"],
      genre: json["genre"],
    );
  }
}
