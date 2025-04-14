import '../../domain/entities/movies.dart';

class MoviesModel extends Movies {
  const MoviesModel({
    required super.id,
    required super.genreIds,
    required super.backdropPath,
    required super.overview,
    required super.releaseDate,
    required super.voteAverage,
    required super.title,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> jsonData) => MoviesModel(
    id: jsonData['id'],
    genreIds: List<int>.from(
      (jsonData['genre_ids'] as List).map((genreId) => genreId),
    ),
    backdropPath: jsonData['backdrop_path'],
    overview: jsonData['overview'],
    releaseDate: jsonData['release_date'],
    voteAverage: jsonData['vote_average'],
    title: jsonData['title'],
  );
}
