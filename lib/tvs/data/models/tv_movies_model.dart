import '../../domain/entities/tv_movies.dart';

class TvMoviesModel extends TvMovies {
  const TvMoviesModel({
    required super.backdropPath,
    required super.firstAirDate,
    required super.id,
    required super.name,
    required super.overview,
    required super.voteAverage,
  });

  factory TvMoviesModel.fromJson(Map<String, dynamic> jsonData) =>
      TvMoviesModel(
        backdropPath: jsonData['backdrop_path'],
        firstAirDate: (jsonData['first_air_date'] as String).substring(0, 4),
        id: jsonData['id'],
        name: jsonData['name'],
        overview: jsonData['overview'],
        voteAverage: jsonData['vote_average'],
      );
}
