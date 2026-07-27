
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FetchMovies extends StatefulWidget {
  const FetchMovies({super.key});

  @override
  State<FetchMovies> createState() => _FetchMoviesState();
}

class _FetchMoviesState extends State<FetchMovies> {
  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    final url = Uri.parse('https://api.tvmaze.com/shows');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      List shows = jsonDecode(response.body);

      print("First 10 Shows:");

      for (int i = 0; i < 10; i++) {
        print(shows[i]['name']);
      }
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Check the console for the API response'),
      ),
    );
  }
}
