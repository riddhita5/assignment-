import 'package:flutter/material.dart';

import 'movies_list.dart' as data;

class ListDesign extends StatefulWidget {
  const ListDesign({super.key});

  @override
  State<ListDesign> createState() => _ListDesignState();
}

class _ListDesignState extends State<ListDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Movie Watchlist", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: data.movies.length,
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final movie = data.movies[index];
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.indigo.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.movie_outlined, color: Colors.indigo),
              ),
              title: Text(
                movie.title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text(
                movie.genre,
                style: TextStyle(color: Colors.grey.shade600),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    movie.isWatched ? Icons.check_circle : Icons.watch_later_outlined,
                    color: movie.isWatched ? Colors.green : Colors.orange,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    movie.isWatched ? "Watched" : "Later",
                    style: TextStyle(
                      fontSize: 10,
                      color: movie.isWatched ? Colors.green : Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
