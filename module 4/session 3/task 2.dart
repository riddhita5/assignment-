import 'package:flutter/material.dart';

class PlaylistScreen6 extends StatelessWidget {
  PlaylistScreen6({super.key});

  final List<String> playlists = [
    "Today's Top Hits",
    "RapCaviar",
    "Hot Hits India",
    "Chill Vibes",
    "Workout Mix",
    "Bollywood Blast",
    "Punjabi Beats",
    "Lo-Fi Sleep",
    "Acoustic Sessions",
    "90's Nostalgia",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Spotify Playlists"),
      ),
      body: ListView.separated(
        itemCount: playlists.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.queue_music),
            title: Text(
              playlists[index],
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.green,
            thickness: 2,
          );
        },
      ),
    );
  }
}