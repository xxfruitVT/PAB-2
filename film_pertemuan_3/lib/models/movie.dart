class Movie {
  final int id;
  final String title;
  final String overview;
  final String backdropPath;
  final String releaseDate;
  final String voteAverage;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.backdropPath,
    required this.releaseDate,
    required this.voteAverage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      backdropPath: json['backdropPath'],
      releaseDate: json['releaseDate'],
      voteAverage: json['voteAverage'],
    );
  }
}
