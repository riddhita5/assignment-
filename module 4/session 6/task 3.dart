import 'package:flutter/material.dart';

class PlaylistScreen2 extends StatelessWidget {
  const PlaylistScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> myPlaylists = [
      "Shape of You",
      "Believer",
      "Perfect",
      "Senorita",
    ];

    List<String> likedSongs = [
      "Blinding Lights",
      "Stay",
      "Heat Waves",
      "Calm Down",
    ];

    List<String> recentlyPlayed = [
      "Flowers",
      "Attention",
      "Bad Habits",
      "Unstoppable",
    ];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Playlist"),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.library_music),
                text: "My Playlists",
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: "Liked Songs",
              ),
              Tab(
                icon: Icon(Icons.history),
                text: "Recently Played",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: myPlaylists.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(myPlaylists[index]),
                );
              },
            ),

            ListView.builder(
              itemCount: likedSongs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(likedSongs[index]),
                );
              },
            ),

            ListView.builder(
              itemCount: recentlyPlayed.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(recentlyPlayed[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}