import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MusicScreen(),
    );
  }
}

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  List<String> playlist = [
    "Perfect",
    "Believer",
  ];

  void addSong(String song) {
    setState(() {
      playlist.add(song);
    });
  }

  void removeSong(String song) {
    setState(() {
      playlist.remove(song);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Music App"),
      ),
      body: Column(
        children: [
          Text(
            "Playlist: ${playlist.length} songs",
            style: const TextStyle(fontSize: 20),
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              addSong("Shape of You");
            },
            child: const Text("Add Song"),
          ),

          const SizedBox(height: 20),

          PlayerWidget(
            playlist: playlist,
            onRemove: removeSong,
          ),
        ],
      ),
    );
  }
}


class PlayerWidget extends StatefulWidget {
  final List<String> playlist;
  final Function(String) onRemove;

  const PlayerWidget({
    super.key,
    required this.playlist,
    required this.onRemove,
  });

  @override
  State<PlayerWidget> createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  List<String> myPlaylist = [
    "Perfect",
    "Believer",
  ];

  void addSong() {
    setState(() {
      myPlaylist.add("Love Story");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Player Widget",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        Text(
          "Songs: ${myPlaylist.length}",
          style: const TextStyle(fontSize: 18),
        ),

        ElevatedButton(
          onPressed: addSong,
          child: const Text("Add Song From Player"),
        ),

        const SizedBox(height: 10),

        ...myPlaylist.map(
              (song) => ListTile(
            title: Text(song),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  myPlaylist.remove(song);
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
