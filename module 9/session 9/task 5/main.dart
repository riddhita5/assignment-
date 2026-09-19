import 'package:assessment4/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoritePlaylistProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Favorite Playlists',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
        useMaterial3: true,
      ),
      home: const PlaylistScreen(),
    );
  }
}

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  final List<String> playlists = const [
    'My Workout',
    'Chill Vibes',
    'Top Hits',
    'Road Trip',
    'Relaxing Music',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Playlists'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavoriteScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: playlists.length,
        itemBuilder: (context, index) {
          final playlist = playlists[index];

          final isFavorite = context
              .watch<FavoritePlaylistProvider>()
              .isFavorite(playlist);

          return ListTile(
            leading: const Icon(Icons.music_note),
            title: Text(playlist),
            trailing: IconButton(
              icon: Icon(
                isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: isFavorite ? Colors.red : null,
              ),
              onPressed: () {
                context
                    .read<FavoritePlaylistProvider>()
                    .toggleFavorite(playlist);
              },
            ),
          );
        },
      ),
    );
  }
}

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider =
    context.watch<FavoritePlaylistProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Playlists'),
      ),
      body: favoriteProvider.favoritePlaylists.isEmpty
          ? const Center(
        child: Text(
          'No favorite playlists yet',
          style: TextStyle(fontSize: 18),
        ),
      )
          : ListView.builder(
        itemCount:
        favoriteProvider.favoritePlaylists.length,
        itemBuilder: (context, index) {
          final playlist =
          favoriteProvider.favoritePlaylists[index];

          return ListTile(
            leading: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            title: Text(playlist),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                context
                    .read<FavoritePlaylistProvider>()
                    .removePlaylist(playlist);
              },
            ),
          );
        },
      ),
    );
  }
}
