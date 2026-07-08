import 'package:flutter/material.dart';
import 'dbhelper.dart';
import 'playlist.dart';

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({super.key});

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  final DbHelper _dbHelper = DbHelper.instance;
  late Future<List<Playlist>> _playlistsFuture;

  @override
  void initState() {
    super.initState();
    _refreshPlaylists();
  }

  void _refreshPlaylists() {
    setState(() {
      _playlistsFuture = _loadPlaylists();
    });
  }

  Future<List<Playlist>> _loadPlaylists() async {
    final List<Map<String, dynamic>> maps = await _dbHelper.queryAllRows();
    return List.generate(maps.length, (i) => Playlist.fromMap(maps[i]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Music Playlists', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder<List<Playlist>>(
        future: _playlistsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.blueAccent));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.library_music, size: 80, color: Colors.grey.shade300),
                  const SizedBox(height: 16),
                  const Text('No playlists found', style: TextStyle(color: Colors.grey, fontSize: 18)),
                ],
              ),
            );
          }

          final playlists = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: playlists.length,
            itemBuilder: (context, index) {
              final playlist = playlists[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                elevation: 2,
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  leading: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.playlist_play, color: Colors.blueAccent),
                  ),
                  title: Text(
                    playlist.name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  subtitle: Text('${playlist.songCount} songs', style: TextStyle(color: Colors.grey.shade600)),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                    onPressed: () async {
                      await _dbHelper.deletedata(playlist.id!);
                      _refreshPlaylists();
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        onPressed: () async {
          final newPlaylist = Playlist(
            name: 'Playlist ${DateTime.now().minute}:${DateTime.now().second}',
            songCount: (DateTime.now().second % 20) + 1,
          );
          await _dbHelper.insertdata(newPlaylist.toMap());
          _refreshPlaylists();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
