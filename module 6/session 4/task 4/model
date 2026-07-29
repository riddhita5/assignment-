class Movie {
  final int id;
  final String title;
  final String? posterPath;

  Movie({required this.id, required this.title, this.posterPath});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['name'] ?? json['title'] ?? 'Unknown',
      posterPath: json['poster_path'] ?? (json['image'] != null ? json['image']['medium'] : null),
    );
  }

  String get posterUrl {
    if (posterPath == null) return 'https://via.placeholder.com/200x300?text=No+Image';
    if (posterPath!.startsWith('http')) return posterPath!;
    return 'https://image.tmdb.org/t/p/w200$posterPath';
  }
}
