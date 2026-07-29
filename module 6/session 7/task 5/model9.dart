class Song {
  final int id;
  final String title;

  Song({required this.id, required this.title});

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title};
  }

  factory Song.fromMap(Map<String, dynamic> map) {
    return Song(id: map['id'], title: map['title']);
  }

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(id: json['id'], title: json['title'] ?? 'Unknown');
  }
}