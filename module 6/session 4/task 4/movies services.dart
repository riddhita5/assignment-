import 'dart:convert';
import 'package:http/http.dart' as http;
import 'movie model.dart';

Future<List<Movie>> fetchMovies() async {
  final url = Uri.parse("https://api.tvmaze.com/shows");

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);

    if (data is List) {
      return data.map((movie) => Movie.fromJson(movie)).toList();
    } else if (data is Map && data.containsKey('results')) {
      return (data['results'] as List).map((movie) => Movie.fromJson(movie)).toList();
    }
    return [];
  } else {
    throw Exception("Failed to load movies. Status: ${response.statusCode}");
  }
}
