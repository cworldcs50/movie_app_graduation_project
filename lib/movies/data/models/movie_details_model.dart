import '../../domain/entities/movie_details.dart';
import 'genres_model.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.id,
    required super.backdropPath,
    required super.genres,
    required super.overview,
    required super.releaseDate,
    required super.runtime,
    required super.title,
    required super.voteAverage,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> jsonData) =>
      MovieDetailsModel(
        id: jsonData['id'],
        backdropPath:
            jsonData['backdrop_path'] ?? "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
        genres: List<GenresModel>.from(
          jsonData['genres'].map((genre) => GenresModel.fromJson(genre)),
        ),
        overview: jsonData['overview'],
        releaseDate: jsonData['release_date'],
        runtime: jsonData['runtime'],
        title: jsonData['title'],
        voteAverage: jsonData['vote_average'],
      );
}
