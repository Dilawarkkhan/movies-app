class MovieModel {
  final int id;
  final String title;
  final String posterImagePath;
  final String backdropImagePath;
  final String overview;
  final String genre;
  final String releaseDate;

  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

  MovieModel({
    required this.id,
    required this.title,
    required this.posterImagePath,
    required this.backdropImagePath,
    required this.overview,
    required this.genre,
    required this.releaseDate,

  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] as int,
      title: json['title'] as String,
      posterImagePath: imageBaseUrl + (json['poster_path'] as String),
      backdropImagePath: imageBaseUrl + (json['backdrop_path'] as String),
      overview: json['overview'] as String,
      genre: json['genre_ids'].toString(),
      releaseDate: json['release_date'] as String,
    );
  }
}
