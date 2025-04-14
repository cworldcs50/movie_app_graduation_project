import 'package:equatable/equatable.dart';

class Movies extends Equatable {
  final int id;
  final List<int> genreIds;
  final num voteAverage;
  final String releaseDate;
  final String backdropPath;
  final String overview;
  final String title;

  const Movies({
    required this.id,
    required this.genreIds,
    required this.backdropPath,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.title,
  });

  @override
  List<Object?> get props => [
    id,
    genreIds,
    backdropPath,
    overview,
    releaseDate,
    voteAverage,
    title,
  ];
}
