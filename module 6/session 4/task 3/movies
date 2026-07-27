import 'dart:convert';
import 'package:http/http.dart' as http;

class Movie {
  final int id;
  final String name;

  Movie({required this.id, required this.name});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Unknown',
    );
  }
}

Future<List<Movie>> fetchMovies() async {
  final url = Uri.parse("https://api.tvmaze.com/shows");
  final response = await http.get(url);

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    return data.map((movie) => Movie.fromJson(movie)).toList();
  } else {
    throw Exception("Failed to load movies");
  }
}
