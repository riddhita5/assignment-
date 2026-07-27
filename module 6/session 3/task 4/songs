import 'package:flutter/material.dart';
import 'playlist.dart';

class song extends StatelessWidget {
  song({super.key});

  @override
  Widget build(BuildContext context) {

    // Sample Spotify Playlist JSON
    Map<String, dynamic> playlistJson = {
      "playlistName": "My Favorite Songs",
      "songs": [
        "Shape of You",
        "Believer",
        "Perfect",
        "Blinding Lights",
        "Levitating"
      ]
    };

    Playlist playlist = Playlist.fromJson(playlistJson);

    print("Playlist: ${playlist.playlistName}");

    for (String song in playlist.songs) {
      print(song);
    }

    return const Scaffold(
      body: Center(
        child: Text("Check the Debug Console"),
      ),
    );
  }
}
