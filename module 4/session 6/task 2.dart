import 'package:flutter/material.dart';

class PlaylistScreen1 extends StatelessWidget {
  const PlaylistScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Playlist"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "My Playlists"),
              Tab(text: "Liked Songs"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            SongList(
              songs: [
                "Shape of You",
                "Believer",
                "Perfect",
                "Senorita",
                "Levitating",
                "Hymn for the Weekend",
                "Photograph",
                "Thinking Out Loud",
              ],
            ),
            SongList(
              songs: [
                "Blinding Lights",
                "Stay",
                "Heat Waves",
                "Calm Down",
                "Unstoppable",
                "Flowers",
                "Bad Habits",
                "Attention",
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SongList extends StatefulWidget {
  final List<String> songs;

  const SongList({
    super.key,
    required this.songs,
  });

  @override
  State<SongList> createState() => _SongListState();
}

class _SongListState extends State<SongList>
    with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return ListView.builder(
      itemCount: widget.songs.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.music_note),
          title: Text(widget.songs[index]),
        );
      },
    );
  }
}