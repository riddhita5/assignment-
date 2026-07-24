import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FatchMovies extends StatefulWidget {
  const FatchMovies({super.key});

  @override
  State<FatchMovies> createState() => _FatchMoviesState();
}

class _FatchMoviesState extends State<FatchMovies> {
  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    final url = Uri.parse('https://api.tvmaze.com/shows');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.body);
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
