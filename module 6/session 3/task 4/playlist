class Playlist {
  String playlistName;
  List<String> songs;

  Playlist({
    required this.playlistName,
    required this.songs,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) {
    return Playlist(
      playlistName: json["playlistName"],
      songs: List<String>.from(json["songs"]),
    );
  }
}
