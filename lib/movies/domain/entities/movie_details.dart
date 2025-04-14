import 'package:equatable/equatable.dart';
import 'genres.dart';

class MovieDetails extends Equatable {
  final String? backdropPath;
  final String title;
  final String releaseDate;
  final num voteAverage;
  final num runtime;
  final String overview;
  final List<Genres> genres;
  final int id;

  const MovieDetails({
    this.backdropPath,
    required this.id,
    required this.genres,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.title,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [
    backdropPath,
    title,
    releaseDate,
    voteAverage,
    runtime,
    overview,
    genres,
  ];
}
